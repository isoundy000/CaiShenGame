--[[
*名称:NewClubInfoLayer
*描述:亲友圈桌子
*作者:admin
*创建日期:2018-06-14 11:22:00
*修改日期:2018-09-25 09:57:35
]]

local EventMgr              = require("common.EventMgr")
local EventType             = require("common.EventType")
local NetMgr                = require("common.NetMgr")
local NetMsgId              = require("common.NetMsgId")
local StaticData            = require("app.static.StaticData")
local UserData              = require("app.user.UserData")
local Common                = require("common.Common")
local Default               = require("common.Default")
local GameConfig            = require("common.GameConfig")
local Log                   = require("common.Log")
local HttpUrl               = require("common.HttpUrl")
local Base64                = require("common.Base64")
local Bit                   = require("common.Bit")

local DefaultTblNum         = 24
local TableScale            = 0.9
local TableSpace            = 0.8

local NewClubInfoLayer      = class("NewClubInfoLayer", cc.load("mvc").ViewBase)

function NewClubInfoLayer:onConfig()
    self.widget             = {
        {"Panel_bg"},
        {"Panel_ui"},
        {"Panel_wayTop"},
        {"Image_head"},
        {"Text_clubName"},
        {"Text_clubID"},
        {"Text_clubPeople"},

        {"Panel_broadcast"},
        {"Text_broadcast"},

        {"Button_return", "onReturn"},
        {"Button_return2", "onReturn"},
        {"Button_playway", "onPlayWay"},
        {"Button_share", "onShare"},
        {"Button_mem", "onMember"},
        {"Image_checkRedPoint"},
        {"Image_chatRedPoint"},
        {"Button_statistics", "onStatistics"},
        {"Button_mgr", "onManager"},
        {"ScrollView_clubTbl"},
        {"Panel_tableItem"},
        {"Button_tblItem"},
        {"Image_bottom"},
        {"Button_quickStart", "onQuickStart"},
        {"Button_custom", "onCustomRoom"},
        {"Button_chat", "onChat"},
        {"Image_noSetWayFlag"},
        {"Image_contextTips"},

        {"Button_moreClub","onMoreClub"},
        {"Panel_moreClub","onMoreClub"},
        {"Image_moreClubFrame"},
        {"Panel_outFrame"},
        {"ListView_more"},
        {"Button_item"},
        {"Button_createClub","onCreateClub"},
        {"Button_joinClub","onJoinClub"},
        {"Image_friendDes"},
        {"Button_cardDes","onCardDes"},
        {"Text_freeTime"},
        {"Text_cardNum"},
        {"Text_freeNum"},
        {"Text_freeDes"},
        {"Image_roomcardFrame"},
        {"Text_pilaozhi"},
        {"Text_qyqPropCount"},
        {"Button_shareChat", "onShareChat"},

        {"Button_mp", "onMingPian"},
        {"Panel_mp"},
        {"Image_mpFrame"},
        {"Image_mp"},
        {"Button_modifymp", "onModifyMp"},

        {"Button_addway", 'onPlayWay'},
        {"Button_selectway"},
        {"Button_notices", "onNotices"},
        {"Panel_mgr", 'onMgr'},
        {"Text_topDes"},
        {"Button_record", "onRecord"},
        {"Button_gonggao", "onGongGao"},
    }
    self.clubData           = {}      --亲友圈大厅数据
    self.userOffice         = 2       --普通成员
    self.userFatigueValue   = 0       --用户疲劳值
    self.btnSwitchFlag      = 0       --0：规则 1：公告
end

function NewClubInfoLayer:onEnter()
    EventMgr:registListener(EventType.RET_GET_CLUB_TABLE,self,self.RET_GET_CLUB_TABLE)
    EventMgr:registListener(EventType.RET_REFRESH_CLUB,self,self.RET_REFRESH_CLUB)
    EventMgr:registListener(EventType.RET_ADD_CLUB_TABLE,self,self.RET_ADD_CLUB_TABLE)
    EventMgr:registListener(EventType.RET_UPDATE_CLUB_TABLE,self,self.RET_UPDATE_CLUB_TABLE)
    EventMgr:registListener(EventType.RET_DEL_CLUB_TABLE,self,self.RET_DEL_CLUB_TABLE)
    EventMgr:registListener(EventType.RET_UPDATE_CLUB_INFO,self,self.RET_UPDATE_CLUB_INFO)
    EventMgr:registListener(EventType.RET_DELED_CLUB,self,self.RET_DELED_CLUB)
    EventMgr:registListener(EventType.RET_CLUB_CHECK_LIST,self,self.RET_CLUB_CHECK_LIST)
    EventMgr:registListener(EventType.SUB_CL_LOGON_SUCCESS,self,self.SUB_CL_LOGON_SUCCESS)
    EventMgr:registListener(EventType.EVENT_TYPE_DID_ENTER_BACKGROUND,self,self.EVENT_TYPE_DID_ENTER_BACKGROUND)
    EventMgr:registListener(EventType.EVENT_TYPE_WILL_ENTER_FOREGROUND,self,self.EVENT_TYPE_WILL_ENTER_FOREGROUND)
    EventMgr:registListener(EventType.RET_GET_CLUB_LIST,self,self.RET_GET_CLUB_LIST)
    EventMgr:registListener(EventType.RET_GET_CLUB_LIST_FAIL,self,self.RET_GET_CLUB_LIST_FAIL)
    EventMgr:registListener(EventType.RET_ADDED_CLUB,self,self.RET_ADDED_CLUB)
    EventMgr:registListener(EventType.RET_UPDATE_CLUB_ROOMCARD,self,self.RET_UPDATE_CLUB_ROOMCARD)
    EventMgr:registListener(EventType.RET_REFRESH_CLUB_PLAY,self,self.RET_REFRESH_CLUB_PLAY)
    EventMgr:registListener(EventType.RET_UPDATE_CLUB_PLAYER_INFO ,self,self.RET_UPDATE_CLUB_PLAYER_INFO)
    EventMgr:registListener(EventType.RET_SETTINGS_CLUB_MEMBER ,self,self.RET_SETTINGS_CLUB_MEMBER)
    EventMgr:registListener(EventType.SUB_CL_USER_INFO ,self,self.SUB_CL_USER_INFO)

    EventMgr:registListener(EventType.RET_CLUB_CHAT_GET_UNREAD_MSG, self, self.RET_CLUB_CHAT_GET_UNREAD_MSG)  -- 返回未读聊天信息
    cc.UserDefault:getInstance():setStringForKey("UserDefault_Operation","NewClubInfoLayer")
end

function NewClubInfoLayer:onExit()
    EventMgr:unregistListener(EventType.RET_GET_CLUB_TABLE,self,self.RET_GET_CLUB_TABLE)
    EventMgr:unregistListener(EventType.RET_REFRESH_CLUB,self,self.RET_REFRESH_CLUB)
    EventMgr:unregistListener(EventType.RET_ADD_CLUB_TABLE,self,self.RET_ADD_CLUB_TABLE)
    EventMgr:unregistListener(EventType.RET_UPDATE_CLUB_TABLE,self,self.RET_UPDATE_CLUB_TABLE)
    EventMgr:unregistListener(EventType.RET_DEL_CLUB_TABLE,self,self.RET_DEL_CLUB_TABLE)
    EventMgr:unregistListener(EventType.RET_UPDATE_CLUB_INFO,self,self.RET_UPDATE_CLUB_INFO)
    EventMgr:unregistListener(EventType.RET_DELED_CLUB,self,self.RET_DELED_CLUB)
    EventMgr:unregistListener(EventType.RET_CLUB_CHECK_LIST,self,self.RET_CLUB_CHECK_LIST)
    EventMgr:unregistListener(EventType.SUB_CL_LOGON_SUCCESS,self,self.SUB_CL_LOGON_SUCCESS)
    EventMgr:unregistListener(EventType.EVENT_TYPE_DID_ENTER_BACKGROUND,self,self.EVENT_TYPE_DID_ENTER_BACKGROUND)
    EventMgr:unregistListener(EventType.EVENT_TYPE_WILL_ENTER_FOREGROUND,self,self.EVENT_TYPE_WILL_ENTER_FOREGROUND)
    EventMgr:unregistListener(EventType.RET_GET_CLUB_LIST,self,self.RET_GET_CLUB_LIST)
    EventMgr:unregistListener(EventType.RET_GET_CLUB_LIST_FAIL,self,self.RET_GET_CLUB_LIST_FAIL)
    EventMgr:unregistListener(EventType.RET_ADDED_CLUB,self,self.RET_ADDED_CLUB)
    EventMgr:unregistListener(EventType.RET_UPDATE_CLUB_ROOMCARD,self,self.RET_UPDATE_CLUB_ROOMCARD)
    EventMgr:unregistListener(EventType.RET_REFRESH_CLUB_PLAY,self,self.RET_REFRESH_CLUB_PLAY)
    EventMgr:unregistListener(EventType.RET_UPDATE_CLUB_PLAYER_INFO ,self,self.RET_UPDATE_CLUB_PLAYER_INFO)
    EventMgr:unregistListener(EventType.RET_SETTINGS_CLUB_MEMBER ,self,self.RET_SETTINGS_CLUB_MEMBER)
    EventMgr:unregistListener(EventType.SUB_CL_USER_INFO ,self,self.SUB_CL_USER_INFO)

    EventMgr:unregistListener(EventType.RET_CLUB_CHAT_GET_UNREAD_MSG, self, self.RET_CLUB_CHAT_GET_UNREAD_MSG)
    if self.clubData ~= nil then
        UserData.Guild:removeCloseClub(self.clubData.dwClubID)
        cc.UserDefault:getInstance():setIntegerForKey("UserDefault_NewClubID", self.clubData.dwClubID)
    end
    self.Panel_tableItem:release()
    self.Button_item:release()
end

function NewClubInfoLayer:onCreate(param)
    self.clubData = param[1]

    self.Chat = UserData.Chat -- 俱乐部聊天信息

    self.Panel_bg:setVisible(false)
    self.Panel_ui:setVisible(false)
    self.Image_checkRedPoint:setVisible(false)
    self.Image_chatRedPoint:setVisible(false)
    self.ScrollView_clubTbl:setVisible(false)
    self.Image_noSetWayFlag:setVisible(false)
    self.Image_roomcardFrame:setVisible(false)
    self.Image_moreClubFrame:setVisible(false)
    self.Panel_outFrame:setVisible(false)
    self.Panel_tableItem:retain()
    self.Button_item:retain()
    self.ListView_more:removeAllChildren()
    local callback = function()
        self:onMoreClub()
    end
    Common:registerScriptMask(self.Panel_outFrame, callback)
    local callback = function()
        self:onCardDes()
    end
    Common:registerScriptMask(self.Image_friendDes, callback)

    local callback2 = function()
        self.Panel_mp:setVisible(false)
        self.Image_mpFrame:setVisible(false)
    end
    Common:registerScriptMask(self.Image_mpFrame, callback2)

    if self.clubData == nil then
        local dwClubID = cc.UserDefault:getInstance():getIntegerForKey("UserDefault_NewClubID", 0)
        if dwClubID ~= 0 then
            UserData.Guild:refreshClub(dwClubID)
        else
            self.ListView_more:removeAllChildren()
            UserData.Guild:getClubList()
        end
    else
        cc.UserDefault:getInstance():setIntegerForKey("UserDefault_NewClubID", self.clubData.dwClubID)
        self:updateClubInfo()
        UserData.Guild:saveLastUseClubRecord(self.clubData.dwClubID)
    end
    self:ReqRecordMsg()
    if StaticData.Hide[CHANNEL_ID].btn20 ~= 1 then 
        self.Button_statistics:setVisible(false)    
        self.Button_share:setVisible(false)    
        self.Button_chat:setVisible(false)    
    end
    -- self.Button_shareChat:setVisible(false)

    local canGo = cc.UserDefault:getInstance():getIntegerForKey("club_record_go",0)
    if canGo == 1 then
        local clubData = {}
        clubData.dwUserID = cc.UserDefault:getInstance():getIntegerForKey("club_dwUserID",0)
        clubData.dwClubID = cc.UserDefault:getInstance():getIntegerForKey("club_dwClubID",0)
        clubData.szClubName = cc.UserDefault:getInstance():getStringForKey("club_ClubName",'')
        dump(clubData,'fx-------------->>')
        local isAdmin = cc.UserDefault:getInstance():getBoolForKey('club_isAdmin',false)
        local box = require("app.MyApp"):create(clubData,isAdmin):createView('NewClubRecord')
        self:addChild(box)
    end
end

function NewClubInfoLayer:onReturn()
    cc.UserDefault:getInstance():setStringForKey("UserDefault_Operation","")
    self:removeFromParent()
end

function NewClubInfoLayer:onShare()
    local data = clone(UserData.Share.tableShareParameter[8])
    if data == nil then
        data = clone(UserData.Share.tableShareParameter[2])
    end
    data.szShareTitle = string.format("亲友圈昵称:%s(亲友圈ID:%d)",self.clubData.szClubName,self.clubData.dwClubID)
    data.szShareContent = "好友邀请您加入亲友圈畅玩游戏,自动开房,点击加入>>>"
    if data.cbShareType == 1 then
        data.szShareUrl = string.format(data.szShareUrl,UserData.User.szAccount, CHANNEL_ID, StaticData.Channels[CHANNEL_ID].appname, self.clubData.dwClubID, UserData.User.szUnionid)
    elseif data.cbShareType == 2 then
        data.szShareImg = string.format(data.szShareImg,UserData.User.userID, self.clubData.dwClubID)
    end
    require("app.MyApp"):create(data):createView("ShareLayer")
end

function NewClubInfoLayer:onMingPian()
    UserData.User:sendMsgUpdateUserInfo(1)
    Common:requestErWeiMaPicture(UserData.User.szErWeiMaLogo, self.Image_mp)
    self.Panel_mp:setVisible(true)
    self.Image_mpFrame:setVisible(true)
end

function NewClubInfoLayer:onModifyMp()
    local data = clone(UserData.Share.tableShareParameter[10])
    if data and data.cbTargetID == 10 then
        local szParameter = string.format("{\"api\":%s,\"userid\":%d}", StaticData.Channels[CHANNEL_ID].recordLink, UserData.User.userID)
        szParameter = Base64.encode(szParameter)
        data.szShareUrl = string.format(data.szShareUrl,szParameter)
        require("app.MyApp"):create(data):createView("ShareLayer")
    end
    self.Panel_mp:setVisible(false)
    self.Image_mpFrame:setVisible(false)
end

function NewClubInfoLayer:onMember()
    local isRedPoint = self.Image_checkRedPoint:isVisible()
    self:addChild(require("app.MyApp"):create(self.clubData, isRedPoint, self.userOffice, self.userFatigueValue):createView("NewClubMemberLayer"))
end

function NewClubInfoLayer:onStatistics()
    local isAdmin = false
    --群主和管理员都有权限
    if UserData.User.userID == self.clubData.dwUserID or self:isAdmin(UserData.User.userID)  then
        isAdmin = true
    end
    cc.UserDefault:getInstance():setStringForKey("club_ClubName",self.clubData.szClubName)
    cc.UserDefault:getInstance():setIntegerForKey("club_dwUserID",self.clubData.dwUserID)
    cc.UserDefault:getInstance():setIntegerForKey("club_dwClubID",self.clubData.dwClubID)
    cc.UserDefault:getInstance():setBoolForKey('club_isAdmin',isAdmin)
    local box = require("app.MyApp"):create(self.clubData,isAdmin):createView('NewClubRecord')
    self:addChild(box)
end

function NewClubInfoLayer:onManager()
    self:addChild(require("app.MyApp"):create(self.clubData):createView("NewClubSetLayer"))
end

function NewClubInfoLayer:onChat()
    if not self.clubData then
        return
    end
    self.Image_chatRedPoint:setVisible(false)
    local box = require("app.MyApp"):create(self.clubData):createView('GroupLayer')
    self:addChild(box)
end

function NewClubInfoLayer:onQuickStart()
    local waynum = self:getPlayWayNums()--self.clubData.cbPlayCount
    local tables = self.ScrollView_clubTbl:getChildren()
    if waynum == 0 then
        require("common.MsgBoxLayer"):create(0,nil,'请选添加玩法')
        return
    end

    local isDisableCB = function()
        if self.clubData.bIsDisable then
            require("common.MsgBoxLayer"):create(0,nil,'亲友圈打烊中')
            return
        end

        if waynum == 1 then
            for i,v in ipairs(tables) do
                if v.data and v.data.dwTableID then
                    local data = v.data
                    local wKindID = math.floor(data.dwTableID/10000)
                    if (wKindID == 51 or wKindID == 53 or wKindID == 55 or wKindID == 56 or wKindID == 57 or wKindID == 58 or wKindID == 59) and data.tableParameter.bCanPlayingJoin == 1 and data.wCurrentChairCount < data.wChairCount  then
                        require("common.SceneMgr"):switchTips(require("app.MyApp"):create(v.data.dwTableID):createView("InterfaceJoinRoomNode"))
                        return
                    elseif data.bIsGameStart == false and data.wCurrentChairCount < data.wChairCount then
                        require("common.SceneMgr"):switchTips(require("app.MyApp"):create(v.data.dwTableID):createView("InterfaceJoinRoomNode"))
                        return
                    end
                end
            end
            require("common.SceneMgr"):switchTips(require("app.MyApp"):create(-2,self.clubData.dwPlayID[1],self.clubData.wKindID[1],self.clubData.wGameCount[1],self.clubData.dwClubID,self.clubData.tableParameter[1]):createView("InterfaceCreateRoomNode"))
            return
        end

        self:addChild(require("app.MyApp"):create(self.clubData, waynum, tables):createView("NewClubQuickRoomLayer"))
    end

    require("app.MyApp"):create(function() 
        performWithDelay(self, isDisableCB, 0.1)
    end):createView("InterfaceCheckRoomNode") 
end

function NewClubInfoLayer:onCustomRoom()
    require("app.MyApp"):create(function() 
        local isDisableCB = function()
            if self.clubData.bIsDisable then
                require("common.MsgBoxLayer"):create(0,nil,'亲友圈打烊中')
                return
            end
            self:addChild(require("app.MyApp"):create(self.clubData.wKindID,2,self.clubData.dwClubID):createView("RoomCreateLayer"))
        end
        performWithDelay(self, isDisableCB, 0.1)
    end):createView("InterfaceCheckRoomNode")
end

function NewClubInfoLayer:onMoreClub()
    local size = self.Panel_moreClub:getContentSize()
    if self.Image_moreClubFrame:isVisible() then
        self.Image_moreClubFrame:stopAllActions()
        local moveto = cc.MoveTo:create(0.2, cc.p(-400, size.height / 2))
        local callfunc = cc.CallFunc:create(function()
            self.Image_moreClubFrame:setVisible(false)
            self.Panel_outFrame:setVisible(false)
        end)
        self.Image_moreClubFrame:runAction(cc.Sequence:create(moveto, callfunc))
    else
        self.Image_moreClubFrame:stopAllActions()
        self.Image_moreClubFrame:setVisible(true)
        self.Panel_outFrame:setVisible(true)
        self.Image_moreClubFrame:setPositionX(-400)
        self.ListView_more:setVisible(false)
        local moveto = cc.MoveTo:create(0.2, cc.p(0, size.height / 2))
        local callfunc = cc.CallFunc:create(function()
            self.ListView_more:setVisible(true)
            self.ListView_more:removeAllChildren()
            UserData.Guild:getClubList()
        end)
        self.Image_moreClubFrame:runAction(cc.Sequence:create(moveto, callfunc))
    end
end

function NewClubInfoLayer:onCreateClub( ... )
    self:addChild(require("app.MyApp"):create(1):createView("NewClubLayer"))
end

function NewClubInfoLayer:onJoinClub( ... )
    self:addChild(require("app.MyApp"):create(2):createView("NewClubLayer"))
end

function NewClubInfoLayer:onCardDes( ... )
    if self.Image_friendDes:isVisible() then
        self.Image_friendDes:setVisible(false)
    else
        self.Image_friendDes:setVisible(true)
    end
end

function NewClubInfoLayer:onPlayWay()
    self:addChild(require("app.MyApp"):create(self.clubData, 2):createView("NewClubSetLayer"))
end

function NewClubInfoLayer:onShareChat()
    local data = clone(UserData.Share.tableShareParameter[9])
    if data then
        data.szShareTitle = string.format(data.szShareTitle, self.clubData.szClubName)
        data.szShareContent = string.format("亲友圈ID：%d  群主：%s，点击进入聊天室", self.clubData.dwClubID, self.clubData.szNickName)
        local appname = StaticData.Channels[CHANNEL_ID].appname
        data.szShareUrl = string.format(data.szShareUrl, self.clubData.dwClubID, CHANNEL_ID, appname)
        -- data.cbTargetType = Bit:_or(data.cbTargetType, 0x20)
        require("app.MyApp"):create(data):createView("ShareLayer")
    end
    dump(data,'type9=')
end

function NewClubInfoLayer:onNotices()
    if self.btnSwitchFlag == 0 then
        self.btnSwitchFlag = 1
        self.Button_notices:loadTextures('csclub/img_guize_deng.png', 'csclub/img_guize_zi.png', 'csclub/img_guize_zi.png')
        self.Text_topDes:setString(self.clubData.szAnnouncement)
    else
        self.btnSwitchFlag = 0
        self.Button_notices:loadTextures('csclub/img_gonggao_deng.png', 'csclub/img_gonggao_zi.png', 'csclub/img_gonggao_zi.png')
        local curIdx = cc.UserDefault:getInstance():getIntegerForKey('playway_pendant', 1)
        self:setPlayWayDes(curIdx)
    end
end

function NewClubInfoLayer:onRecord()
    self:addChild(require("app.MyApp"):create(self.clubData, 3):createView("NewClubSetLayer"))
end

function NewClubInfoLayer:onGongGao()
    self:addChild(require("app.MyApp"):create(self.clubData):createView("NewClubNoticeLayer"))
end

------------------------------------------------------------------------

function NewClubInfoLayer:createClubTable()
    self.ScrollView_clubTbl:removeAllChildren()
    local waynum = self:getPlayWayNums()--self.clubData.cbPlayCount
    if waynum <= 0 then
        return
    end
    
    local inerSize = self.ScrollView_clubTbl:getContentSize()
    local scrollW = (inerSize.width / 3) * math.ceil((waynum-1) / 2)
    self.ScrollView_clubTbl:setInnerContainerSize(cc.size(scrollW, inerSize.height))
    local index = 0
    for i,v in ipairs(self.clubData.wKindID) do
        local gameinfo = StaticData.Games[v]
        if v ~= 0 and gameinfo then
            index = index + 1
            local parameter = self.clubData.tableParameter[i]
            local playerNum = parameter.bPlayerCount
            local item = self.Panel_tableItem:clone()
            item:setScale(1)
            self.ScrollView_clubTbl:addChild(item)
            
            local row = index % 2
            if row == 0 then
                row = 2
            end
            local col = math.ceil(index / 2)
            local x = 120 + (col - 1) * 310
            local y = 290 - (row - 1) * 220
            item:setPosition(x, y)
            item.data = {}
            item.data.pos = (col - 1) * 2 + row

            for i=1,4 do
                local footItem = ccui.Helper:seekWidgetByName(item,"Image_foot" .. i)
                if i <= playerNum then
                    footItem:setVisible(true)
                else
                    footItem:setVisible(false)
                end
            end

            local uiText_wayName = ccui.Helper:seekWidgetByName(item,"Text_wayName")
            if self.clubData.szParameterName[i] ~= "" and self.clubData.szParameterName[i] ~= " " then
                uiText_wayName:setString(self.clubData.szParameterName[i])
            else
                local kindid = self.clubData.wKindID[i]
                uiText_wayName:setString(StaticData.Games[kindid].name)
            end
            local uiText_turnNum = ccui.Helper:seekWidgetByName(item,"Text_turnNum")
            local jushu = self.clubData.wGameCount[i]
            uiText_turnNum:setString(jushu .. '局/' .. parameter.bPlayerCount .. '人')
            
            local Text_tableIdx = ccui.Helper:seekWidgetByName(item,"Text_tableIdx")
            Text_tableIdx:setString(index)

            local Button_tblItem = ccui.Helper:seekWidgetByName(item,"Button_tblItem")
            Common:addTouchEventListener(Button_tblItem,function(sender,event)
                local isDisableCB = function()
                    if not self.clubData.bIsDisable then
                        require("common.SceneMgr"):switchTips(require("app.MyApp"):create(-2,self.clubData.dwPlayID[i],v,jushu,self.clubData.dwClubID,parameter):createView("InterfaceCreateRoomNode"))
                    else
                        require("common.MsgBoxLayer"):create(0,nil,'亲友圈打烊中')
                    end
                end
                require("app.MyApp"):create(function() 
                    performWithDelay(self, isDisableCB, 0.1)
                end):createView("InterfaceCheckRoomNode") 
            end)
        end
    end

    self:initPlayWayPendant()
end

--是否是管理员
function NewClubInfoLayer:isAdmin(userid, adminData)
    adminData = adminData or self.clubData.dwAdministratorID
    for i,v in ipairs(adminData or {}) do
        if v == userid then
            return true
        end
    end
    return false
end

--刷新亲友圈
function NewClubInfoLayer:updateClubInfo()
    self.Panel_bg:setVisible(true)
    self.Panel_ui:setVisible(true)
    self.Image_checkRedPoint:setVisible(false)  
    self.Image_chatRedPoint:setVisible(false)
    UserData.Guild:addEnterClub(self.clubData.dwClubID)
    Common:requestUserAvatar(self.clubData.dwUserID, self.clubData.szLogoInfo, self.Image_head, "clip")
    self.Text_clubName:setString(self.clubData.szClubName)
    self.Text_clubID:setString("ID:" .. self.clubData.dwClubID)
    self.Text_clubPeople:setString(self.clubData.dwOnlinePlayerCount .. '/' .. self.clubData.dwClubPlayerCount)
    self.Text_qyqPropCount:setString("亲友圈房卡:" .. self.clubData.dwPropCount)
    self.Button_custom:setVisible(self.clubData.bHaveCustomizeRoom)
    if self.clubData.dwUserID ~= UserData.User.userID and not self:isAdmin(UserData.User.userID) then
    else
        UserData.Guild:getClubCheckList(self.clubData.dwClubID)
        UserData.Guild:getClubCardInfo(self.clubData.dwClubID)
    end
    if self.clubData.cbPlayCount > 0 then
        self.Image_noSetWayFlag:setVisible(false)
        self.ScrollView_clubTbl:setVisible(true)
    else
        self.ScrollView_clubTbl:setVisible(false)
        self.Image_noSetWayFlag:setVisible(true)
        if UserData.User.userID == self.clubData.dwUserID or self:isAdmin(UserData.User.userID) then
            self.Image_contextTips:loadTexture('newclub/newclub_m25.png')
        else
            self.Image_contextTips:loadTexture('newclub/newclub_m24.png')
        end
    end

    --广播
    -- if not self.clubData.szAnnouncement or self.clubData.szAnnouncement == "" or self.clubData.szAnnouncement == " " then
    --     self:playBroadcast('欢迎加入亲友圈，祝大家生活愉快')
    -- else
    --     self:playBroadcast(self.clubData.szAnnouncement)
    -- end

    local isAdmin = false
    if UserData.User.userID == self.clubData.dwUserID or self:isAdmin(UserData.User.userID)  then
        isAdmin = true
    end
    -- self.Image_roomcardFrame:setVisible(isAdmin)

    if CHANNEL_ID == 6 or CHANNEL_ID == 7 then
        self.Text_qyqPropCount:setVisible(false)
    end
end

function NewClubInfoLayer:resetClubTable(item)
    item.data = nil
end

--移除所有亲友圈桌子
function NewClubInfoLayer:removeAllClubTable()
    local items = self.ScrollView_clubTbl:getChildren()
    for key, var in pairs(items) do
        self:resetClubTable(var)
    end
end

--移除亲友圈桌子
function NewClubInfoLayer:removeClubTable(dwTableID)
    local items = self.ScrollView_clubTbl:getChildren()
    for key, var in pairs(items) do
        if var.data and var.data.dwTableID == dwTableID then
            if self.clubData.cbPlayCount <= 1 then
                self:resetClubTable(var)
            else
                local item = self.ScrollView_clubTbl:getChildByName('club_table_' .. dwTableID)
                if item then
                    item:removeFromParent()
                    local arr = self.ScrollView_clubTbl:getChildren()
                    local function comp(v1, v2)
						if v1.data.pos < v2.data.pos then
							return true
						else
							return false
						end
                    end
                    table.sort(arr, comp)
                    local i = #arr
                    local inerSize = self.ScrollView_clubTbl:getContentSize()
                    local scrollW = (inerSize.width / 3) * math.ceil(i / 2)
                    self.ScrollView_clubTbl:setInnerContainerSize(cc.size(scrollW, inerSize.height))
                    for i,v in ipairs(arr) do
                        local row = i % 2
                        if row == 0 then
                            row = 2
                        end
                        local col = math.ceil(i / 2)
                        local x = 120 + (col - 1) * 310
                        local y = 290 - (row - 1) * 220
                        v:setPosition(x, y)
                        v.data.pos = (col - 1) * 2 + row
                    end
                end
            end
            break
        end
    end
end

-- 桌子重新排序
-- dwTableID:桌子ID
-- posFlag: 0:插头部  1:插尾部
function NewClubInfoLayer:sortNewTable(dwTableID, playwaynum, posFlag)
    local tableArr = self.ScrollView_clubTbl:getChildren()
    local function comp(v1, v2)
		if v1.data.pos < v2.data.pos then
			return true
		else
			return false
		end
    end
    table.sort(tableArr, comp)
    
    if posFlag == 0 then
        local isInsert = false
        for i,v in ipairs(tableArr) do
            if v.data and v.data.dwTableID then
                local idx = i + 1
                if isInsert then
                    idx = i
                end

                if v.data.dwTableID == dwTableID then
                    idx = playwaynum + 1
                    isInsert = true
                end

                local row = idx % 2
                if row == 0 then
                    row = 2
                end
                local col = math.ceil(idx / 2)
                local x = 120 + (col - 1) * 310
                local y = 290 - (row - 1) * 220
                v:setPosition(x, y)
                v.data.pos = (col - 1) * 2 + row
            end
        end
    elseif posFlag == 1 then
        local isInsert = false
        for i,v in ipairs(tableArr) do
            if v.data and v.data.dwTableID then
                local idx = i
                if isInsert then
                    idx = i - 1
                end

                if v.data.dwTableID == dwTableID then
                    idx = #tableArr
                    isInsert = true
                end

                local row = idx % 2
                if row == 0 then
                    row = 2
                end
                local col = math.ceil(idx / 2)
                local x = 120 + (col - 1) * 310
                local y = 290 - (row - 1) * 220
                v:setPosition(x, y)
                v.data.pos = (col - 1) * 2 + row
            end
        end
    end
end

--桌子是否满人
function NewClubInfoLayer:isFullPeopleTable(data)
    local num = 0
    for k,v in pairs(data.dwUserID) do
        if v ~= 0 then
            num = num + 1
        end
    end

    if num >= data.wChairCount then
        return true
    end
    return false
end

--刷新某个桌子信息
function NewClubInfoLayer:refreshTableOneByOne(data)
    Log.d(data)
    local item = self.ScrollView_clubTbl:getChildByName('club_table_' .. data.dwTableID)
    local isNewCreate = true
    if not item then
        local i = #self.ScrollView_clubTbl:getChildren() + 1
        local inerSize = self.ScrollView_clubTbl:getContentSize()
        local scrollW = (inerSize.width / 3) * math.ceil(i / 2)
        self.ScrollView_clubTbl:setInnerContainerSize(cc.size(scrollW, inerSize.height))
        item = self.Panel_tableItem:clone()
        item:setScale(1)
        self.ScrollView_clubTbl:addChild(item)
        item:setName('club_table_' .. data.dwTableID)
        
        local Image_tableIdx = ccui.Helper:seekWidgetByName(item,"Image_tableIdx")
        local Text_tableIdx = ccui.Helper:seekWidgetByName(item,"Text_tableIdx")
        local idx = self:getMoreTableIndex(data.wTableSubType)
        if idx then
            Image_tableIdx:setVisible(true)
            Text_tableIdx:setString(idx)
        else
            Image_tableIdx:setVisible(false)
        end
    else
        isNewCreate = false
    end
	
	if isNewCreate then
        item.data = data
		item.data.pos = #self.ScrollView_clubTbl:getChildren()
    else
        local pos = item.data.pos
        item.data = data
        item.data.pos = pos
	end

    local playwaynum = self:getPlayWayNums()
    -- 只刷新新创建桌子与玩家加入，局数刷新不刷位置
    if isNewCreate or data.wCurrentGameCount <= 0 then
        if self:isFullPeopleTable(data) then
            self:sortNewTable(data.dwTableID, playwaynum, 1)
        else
            self:sortNewTable(data.dwTableID, playwaynum, 0)
        end
    end

    local playerNum = data.tableParameter.bPlayerCount
    local headNum = 4
    if playerNum <= 4 then
        headNum = 4
    else
        headNum = playerNum
    end

    for i=1,4 do
        local footItem = ccui.Helper:seekWidgetByName(item,"Image_foot" .. i)
        if i <= playerNum then
            footItem:setVisible(true)
        else
            footItem:setVisible(false)
        end
    end

    local uiText_wayName = ccui.Helper:seekWidgetByName(item,"Text_wayName")
    local idx = self:getMoreTableIndex(data.wTableSubType)
    if idx then
        if self.clubData.szParameterName[idx] ~= "" and self.clubData.szParameterName[idx] ~= " " then
            uiText_wayName:setString(self.clubData.szParameterName[idx])
        else
            uiText_wayName:setString(StaticData.Games[data.wKindID].name)
        end
    else
        uiText_wayName:setString(StaticData.Games[data.wKindID].name)
    end
    
    local uiText_turnNum = ccui.Helper:seekWidgetByName(item,"Text_turnNum")
    uiText_turnNum:setString('局数:' .. data.wCurrentGameCount .. '/' .. data.wGameCount)

    if playerNum == 2 then
        local tableIndex = {1,3,2,4}
        for i, var in pairs(tableIndex) do
            local uiPanel_head = ccui.Helper:seekWidgetByName(item,string.format("Panel_head%d",var))
            uiPanel_head:setVisible(true)
            if i <= data.wChairCount and data.dwUserID[i] ~= 0 then
                local uiImage_avatar = ccui.Helper:seekWidgetByName(uiPanel_head,"Image_avatar")
                Common:requestUserAvatar(data.dwUserID[i],data.szLogoInfo[i],uiImage_avatar,"clip")
            else
                uiPanel_head:setVisible(false)
            end
        end
    else
        for i = 1, headNum do
            local uiPanel_head = ccui.Helper:seekWidgetByName(item,string.format("Panel_head%d",i))
            uiPanel_head:setVisible(true)
            if i <= data.wChairCount and data.dwUserID[i] ~= 0 then
                local uiImage_avatar = ccui.Helper:seekWidgetByName(uiPanel_head,"Image_avatar")
                Common:requestUserAvatar(data.dwUserID[i],data.szLogoInfo[i],uiImage_avatar,"clip")
            else
                if headNum > 4 then
                    uiPanel_head:setVisible(true)
                    local uiImage_avatar = ccui.Helper:seekWidgetByName(uiPanel_head,"Image_avatar")
                    local headCliping = uiImage_avatar:getChildByName('headCliping')
                    if headCliping then
                        headCliping:removeFromParent()
                    end
                    uiImage_avatar:loadTexture('newcommon/head_nopeople.png')
                else
                    uiPanel_head:setVisible(false)
                end
            end
        end
    end

    local Button_tblItem = ccui.Helper:seekWidgetByName(item,"Button_tblItem")
    Common:addTouchEventListener(Button_tblItem,function(sender,event)
        local isAdmin = false
        if UserData.User.userID == self.clubData.dwUserID then
            isAdmin = true
        end
        if self:isAdmin(UserData.User.userID) then
            isAdmin = true
        end

        if (CHANNEL_ID == 10 or CHANNEL_ID == 11) and not isAdmin then
            require("common.SceneMgr"):switchTips(require("app.MyApp"):create(item.data.dwTableID):createView("InterfaceJoinRoomNode"))
            return
        end
        require("app.MyApp"):create(function()
            local isDisableCB = function()
                if self.clubData.bIsDisable then
                    require("common.MsgBoxLayer"):create(0,nil,'亲友圈打烊中')
                    return
                end
                self:addChild(require("app.MyApp"):create(item.data, isAdmin):createView("ClubTableLayer")) 
            end
            performWithDelay(self, isDisableCB, 0.1)
        end):createView("InterfaceCheckRoomNode")
    end)
end

--广播
-- function NewClubInfoLayer:playBroadcast(notice)
--     printInfo('playBroadcast:%s', notice)
--     self.Text_broadcast:stopAllActions()
--     self.Panel_broadcast:stopAllActions()
--     local function showBroadcast()
--         if not self.Panel_broadcast:isVisible() then
--             self.Text_broadcast:setString(notice)
--             self.Text_broadcast:setPositionX(self.Text_broadcast:getParent():getContentSize().width)
--             local time = (self.Text_broadcast:getParent():getContentSize().width + self.Text_broadcast:getAutoRenderSize().width)/100
--             self.Text_broadcast:runAction(cc.MoveTo:create(time,cc.p(-self.Text_broadcast:getAutoRenderSize().width,self.Text_broadcast:getPositionY())))
--             self.Panel_broadcast:runAction(cc.Sequence:create(cc.DelayTime:create(time),cc.Hide:create(),cc.DelayTime:create(5),cc.CallFunc:create(showBroadcast)))
--             self.Panel_broadcast:setVisible(true)
--         else
--             self.Panel_broadcast:setVisible(false)
--             self.Panel_broadcast:runAction(cc.Sequence:create(cc.DelayTime:create(1),cc.CallFunc:create(showBroadcast)))
--         end
--     end
--     showBroadcast()
-- end

--添加一个亲友圈节点
function NewClubInfoLayer:addOnceClubItem(data)
    if type(data) ~= 'table' then
        printError('NewClubInfoLayer:addOnceClubItem data error')
        return
    end
    local item = self.Button_item:clone()
    item:setName('clubitem_' .. data.dwClubID)
    item.data = data
    local Image_selLight = self:seekWidgetByNameEx(item, "Image_selLight")
    local Image_leadHead = self:seekWidgetByNameEx(item, "Image_leadHead")
    local Text_leader    = self:seekWidgetByNameEx(item, "Text_leader")
    local Text_memNum    = self:seekWidgetByNameEx(item, "Text_memNum")
    local Text_playWay   = self:seekWidgetByNameEx(item, "Text_playWay")
    if data.dwClubID == self.clubData.dwClubID then
        Image_selLight:setVisible(true)
        self.lastSelLight = Image_selLight
        --self.ListView_more:insertCustomItem(item, 0)
    else
        Image_selLight:setVisible(false)
		--self.ListView_more:pushBackCustomItem(item)
    end
	
    local items = self.ListView_more:getItems()
    local isFound = false
    local tableFrontClubList = {}
    for key, var in pairs(UserData.Guild.tableLastUseClubRecord) do
    	if var == data.dwClubID then
    	    isFound = true
    	    break
    	end
        table.insert(tableFrontClubList,1,var)
    end
    if isFound == false then
        self.ListView_more:pushBackCustomItem(item)
    else
        local pos = 0
        local isFound = false
        for key, var in pairs(tableFrontClubList) do
            for k, v in pairs(items) do
        		local tempData = v.data
        		if tempData.dwClubID == var then
        		    pos = k
        		    isFound = true
        		    break
        		end
        	end
        	if isFound == true then
        	   break
        	end
        end
        self.ListView_more:insertCustomItem(item,pos)
    end
    Common:requestUserAvatar(data.dwUserID, data.szLogoInfo, Image_leadHead, "img")
    -- Text_leader:setColor(cc.c3b(114, 67, 13))
    -- Text_memNum:setColor(cc.c3b(114, 67, 13))
    -- Text_playWay:setColor(cc.c3b(114, 67, 13))
    Text_leader:setString(data.szClubName)
    Text_playWay:setString("圈ID:" .. data.dwClubID)
    Text_memNum:setString(data.dwOnlinePlayerCount .. '/' .. data.dwClubPlayerCount)
    self:setMemberMgrFlag(item, data)

    item:setTouchEnabled(true)
    item:addClickEventListener(function(sender)
        if self.lastSelLight then
            self.lastSelLight:setVisible(false)
        end
        Image_selLight:setVisible(true)
        self.lastSelLight = Image_selLight
        UserData.Guild:refreshClub(data.dwClubID)
    end)
    self.ListView_more:refreshView()
end

--设置成员不同权限标识
function NewClubInfoLayer:setMemberMgrFlag(item, data)
    if not item then
        return
    end
    data = data or {}
    local Image_adminIcon = self:seekWidgetByNameEx(item, "Image_adminIcon")
    if data.dwUserID == UserData.User.userID then
        Image_adminIcon:setVisible(true)
        Image_adminIcon:loadTexture('newclub/newclub_m22.png')
    elseif self:isAdmin(UserData.User.userID, data.dwAdministratorID) then
        Image_adminIcon:setVisible(true)
        Image_adminIcon:loadTexture('newclub/newclub_m21.png')
    else
        Image_adminIcon:setVisible(false)
    end
end

--刷新房卡信息
function NewClubInfoLayer:refreshRoomCardInfo(data)
    if type(data) ~= 'table' then
        printError('NewClubInfoLayer:refreshRoomCardInfo data error')
        return
    end
    local dwRoomCardCount = Common:itemNumberToString(data.dwRoomCardCount)
    self.Text_cardNum:setString(dwRoomCardCount .. '张')
    local dwSavingCount = Common:itemNumberToString(data.dwSavingCount)
    self.Text_freeNum:setString(dwSavingCount .. '张')
    self.Text_freeDes:setPositionX(0)

    self.Text_freeTime:stopAllActions()
    local time = data.dwDeadlineTime - UserData.Time:getServerTimer()  --os.time()
    local function update()
        time = data.dwDeadlineTime - UserData.Time:getServerTimer()
        if time <= 0 then
            time = 0
            self.Text_freeTime:stopAllActions()
        end
        
        local d = math.floor(time / 86400)
        local h = math.floor(time / 3600) % 24
        local m = math.floor(time / 60) % 60
        self.Text_freeTime:setString(string.format('%02d天 %02d小时 %02d分', d, h, m))
    end
    schedule(self.Text_freeTime, update, 1)
    update()
end

function NewClubInfoLayer:megerClubData(data)
    if type(data) ~= 'table' then
        return
    end
    self.clubData = self.clubData or {}
    for k,v in pairs(data) do
        self.clubData[k] = v
    end
end

function NewClubInfoLayer:getMoreTableIndex(wplayId)
    for i,v in ipairs(self.clubData.dwPlayID or {}) do
        if v == wplayId then
            return i
        end
    end
    return nil
end

function NewClubInfoLayer:getPlayWayNums()
    local num = 0
    for i,v in ipairs(self.clubData.wKindID or {}) do
        local gameinfo = StaticData.Games[v]
        if gameinfo then
            num = num + 1
        end
    end
    return num
end
      
--请求未读聊天信息
function NewClubInfoLayer:ReqRecordMsg()
    self.Chat:SendChatUnReadMsg()
end

------------------------------------------------------------------------
--一个个返回有人桌子详情
function NewClubInfoLayer:RET_GET_CLUB_TABLE(event)
    local data = event._usedata
    if self.clubData == nil or self.clubData.dwClubID ~= data.dwClubID then
        return
    end
    self:refreshTableOneByOne(data)
end

--亲友圈刷新返回
function NewClubInfoLayer:RET_REFRESH_CLUB(event)
    local data = event._usedata
    Log.d(data)
    if data.dwClubID == 0 or data.dwUserID == 0 then
        cc.UserDefault:getInstance():setIntegerForKey("UserDefault_NewClubID", 0)
        self.ListView_more:removeAllChildren()
        UserData.Guild:getClubList()
        return
    end
    self:megerClubData(data)
    UserData.Guild:saveLastUseClubRecord(self.clubData.dwClubID)
    cc.UserDefault:getInstance():setIntegerForKey("UserDefault_NewClubID", self.clubData.dwClubID)
    self:updateClubInfo()
end

--返回刷新俱乐部玩法
function NewClubInfoLayer:RET_REFRESH_CLUB_PLAY(event)
    local data = event._usedata
    Log.d(data)
    self:megerClubData(data)
    self:createClubTable()
    UserData.Guild:getClubTable(data.dwClubID)
    UserData.Guild:getUpdateClubInfo(self.clubData.dwClubID, UserData.User.userID)
end

--更新亲友圈信息
function NewClubInfoLayer:RET_UPDATE_CLUB_INFO(event)
    local data = event._usedata
    Log.d(data)
    self:megerClubData(data)
    self:updateClubInfo()
end

--添加亲友圈牌桌
function NewClubInfoLayer:RET_ADD_CLUB_TABLE(event)
    local data = event._usedata
    if self.clubData == nil or self.clubData.dwClubID ~= data.dwClubID then
        return
    end
    self:refreshTableOneByOne(data)
end

--刷新亲友圈牌桌
function NewClubInfoLayer:RET_UPDATE_CLUB_TABLE(event)
    local data = event._usedata
    if self.clubData == nil or self.clubData.dwClubID ~= data.dwClubID then
        return
    end
    self:refreshTableOneByOne(data)
end

--删除亲友圈牌桌
function NewClubInfoLayer:RET_DEL_CLUB_TABLE(event)
    local data = event._usedata
    Log.d(data)
    if self.clubData == nil or self.clubData.dwClubID ~= data.dwClubID then
        return
    end
    self:removeClubTable(data.dwTableID)
end

--被删除亲友圈
function NewClubInfoLayer:RET_DELED_CLUB(event)
    local data = event._usedata
    if self.clubData.dwClubID == data.dwClubID then
        self:removeFromParent()
    else
        -- local item = self.ListView_more:getChildByName('clubitem_' .. data.dwClubID)
        -- if item then
        --     item:removeFromParent()
        --     self.ListView_more:refreshView()
        -- end
    end
    local str = string.format("您被踢出亲友圈[%d]!",data.dwClubID)
    require("common.MsgBoxLayer"):create(0,nil,str)
end

--返回审核列表
function NewClubInfoLayer:RET_CLUB_CHECK_LIST(event)
    self.Image_checkRedPoint:setVisible(true)
end

--登陆成功(断线重连)
function NewClubInfoLayer:SUB_CL_LOGON_SUCCESS(event)
    local dwClubID = cc.UserDefault:getInstance():getIntegerForKey("UserDefault_NewClubID", 0)
    if dwClubID ~= 0 then
        UserData.Guild:refreshClub(dwClubID)
    else
        require("common.SceneMgr"):switchOperation(require("app.MyApp"):create():createView("NewClubLayer"))
    end
end

--进入后台
function NewClubInfoLayer:EVENT_TYPE_DID_ENTER_BACKGROUND(event)
    if self.clubData then
        UserData.Guild:removeCloseClub(self.clubData.dwClubID)
    end
end

--恢复回来
function NewClubInfoLayer:EVENT_TYPE_WILL_ENTER_FOREGROUND(event)
    local dwClubID = cc.UserDefault:getInstance():getIntegerForKey("UserDefault_NewClubID", 0)
    if dwClubID ~= 0 then
        UserData.Guild:refreshClub(dwClubID)
    else
        require("common.SceneMgr"):switchOperation(require("app.MyApp"):create():createView("NewClubLayer"))
    end
end

--返回亲友圈列表(一个个返回)
function NewClubInfoLayer:RET_GET_CLUB_LIST(event)
    local data = event._usedata
    Log.d(data)
    local dwClubID = cc.UserDefault:getInstance():getIntegerForKey("UserDefault_NewClubID", 0)
    if dwClubID == 0 then
        -- self.clubData = self.clubData or {}
        -- self.clubData.dwClubID = data.dwClubID
        self:megerClubData(data)
        cc.UserDefault:getInstance():setIntegerForKey("UserDefault_NewClubID", data.dwClubID)
        UserData.Guild:refreshClub(data.dwClubID)
    end
    self:addOnceClubItem(data)
end

--没有亲友圈返回
function NewClubInfoLayer:RET_GET_CLUB_LIST_FAIL(event)
    require("common.SceneMgr"):switchOperation(require("app.MyApp"):create():createView("NewClubLayer"))
end

--被添加亲友圈
function NewClubInfoLayer:RET_ADDED_CLUB(event)
    local data = event._usedata
    self:addOnceClubItem(data)
end

--返回亲友圈的房卡
function NewClubInfoLayer:RET_UPDATE_CLUB_ROOMCARD(event)
    local data = event._usedata
    Log.d(data)
    if self.clubData and data.dwClubID == self.clubData.dwClubID then
        self:refreshRoomCardInfo(data)
    end
end

function NewClubInfoLayer:RET_UPDATE_CLUB_PLAYER_INFO(event)
    local data = event._usedata
    Log.d(data)
    self.userOffice = data.cbOffice
    self.userFatigueValue = data.lFatigueValue
    self.Text_pilaozhi:setString('疲劳值:' .. data.lFatigueValue)
end

function NewClubInfoLayer:RET_SETTINGS_CLUB_MEMBER(event)
    local data = event._usedata
    Log.d(data)
    if data.cbSettingsType == 6 and data.dwUserID == UserData.User.userID then
        --疲劳值
        self.userFatigueValue = data.lFatigueValue
        self.Text_pilaozhi:setString('疲劳值:' .. data.lFatigueValue)
    elseif data.cbSettingsType == 7 then
        UserData.Guild:getUpdateClubInfo(self.clubData.dwClubID, UserData.User.userID)
    end
end


--msg 未读消息返回
function NewClubInfoLayer:RET_CLUB_CHAT_GET_UNREAD_MSG( event )
    local data = event._usedata
    if not self.isClickFirst then
        if self.clubData then
            if self.clubData.dwClubID == data.dwClubID then
                self.Image_chatRedPoint:setVisible(data.isHaveMsg)   
                self.isClickFirst = true
            end
        end
    end     
end

function NewClubInfoLayer:SUB_CL_USER_INFO(event)
    print('刷新名片：', UserData.User.szErWeiMaLogo)
    Common:requestErWeiMaPicture(UserData.User.szErWeiMaLogo, self.Image_mp)
end


--*****************************************************--
function NewClubInfoLayer:initPlayWayPendant()
    local len = 0
    for i,v in ipairs(self.clubData.wKindID) do
        local gameinfo = StaticData.Games[v]
        if gameinfo then
            len = len + 1
        end
    end

    local fix = 0
    if len >= 6 then
        self.Button_addway:setVisible(false)
        fix = 97
    else
        self.Button_addway:setVisible(true)
        fix = 0
    end

    self.Panel_wayTop:removeAllChildren()
    local index = 0
    for i,v in ipairs(self.clubData.wKindID) do
        local gameinfo = StaticData.Games[v]
        if gameinfo then
            index = index + 1
            local idx = index
            local item = self.Button_selectway:clone()
            self.Panel_wayTop:addChild(item)
            local x = 1133 - (len - index) * 97 + fix
            item:setPosition(x, self.Panel_wayTop:getContentSize().height)
            local Text_wayname = ccui.Helper:seekWidgetByName(item, "Text_wayname")
            local Text_idxEx = ccui.Helper:seekWidgetByName(item, "Text_idxEx")
            if self.clubData.szParameterName[i] ~= "" and self.clubData.szParameterName[i] ~= " " then
                Text_wayname:setString(self.clubData.szParameterName[i])
            else
                local kindid = self.clubData.wKindID[i]
                Text_wayname:setString(StaticData.Games[kindid].name)
            end
            Text_idxEx:setString(index)
            item:setPressedActionEnabled(true)
            item:addClickEventListener(function(sender)
                require("common.Common"):playEffect("common/buttonplay.mp3")
                self:selPlayWayTopBtn(idx, i)
            end)
        end
    end
    local curIdx = cc.UserDefault:getInstance():getIntegerForKey('playway_pendant', 1)
    self:selPlayWayTopBtn(curIdx)
end

function NewClubInfoLayer:selPlayWayTopBtn(idx, index)
    index = index or idx
    local items = self.Panel_wayTop:getChildren()
    for i,v in ipairs(items) do
        local Text_wayname = ccui.Helper:seekWidgetByName(v, "Text_wayname")
        if i == idx then
            v:loadTextures('csclub/btn_play_n.png', 'csclub/btn_play_n.png', 'csclub/btn_play_n.png')
            Text_wayname:setColor(cc.c3b(134, 72, 29))
            cc.UserDefault:getInstance():setIntegerForKey('playway_pendant', i)
        else
            v:loadTextures('csclub/btn_play_s.png', 'csclub/btn_play_s.png', 'csclub/btn_play_s.png')
            Text_wayname:setColor(cc.c3b(255, 255, 255))
        end
    end
    self:setPlayWayDes(index)
end

function NewClubInfoLayer:setPlayWayDes(index)
    if self.btnSwitchFlag == 1 then
        return
    end
    local desc = require("common.GameDesc"):getGameDesc(self.clubData.wKindID[index], self.clubData.tableParameter[index])
    self.Text_topDes:setString(desc)
end

return NewClubInfoLayer