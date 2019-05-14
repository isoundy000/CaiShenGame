local Games = {
    --id="游戏ID",name="游戏名字",type="游戏类型",friends="是否有好友房>>1好友房>>2休闲场>>3竞技场",number ="金币房人数",playerCount="人数选择",isZuoXing4="是否有4人坐省",icon="大厅按钮图片",icon1="大厅按钮图片1",icons="大厅按钮图片2",icon8="八字玩法图片",ruleBtn="规则按钮图片",ruleCSB="规则网页节点",imgSynopsiss="游戏简介图片",imgSynopsis="游戏简介图片",luaCreateRoomFile="游戏创房lua文件",luaGameFile="游戏执行lua文件",imgDesk="游戏桌面图片", rules ="规则",
    [15]={ id=15, name="桂林大字牌", type=1, friends=7, number =3, playerCount = "3", isZuoXing4=0, icon="game/paohuzi/15/icon.png", icons="game/paohuzi/15/icon1.png", icon1="game/paohuzi/15/icon2.png", icon8="game/paohuzi/15/icon8.png", ruleBtn="game/paohuzi/15/rule.png;game/paohuzi/15/rule_1.png", ruleCSB="http://share.hy.qilaigame.com/rule/wanfa/15.html", imgSynopsiss="game/paohuzi/15/names.png", imgSynopsis="game/paohuzi/15/name.png", luaCreateRoomFile="RoomCreateLayer15", luaGameFile="game.paohuzi.15.GameLayer", imgDesk="game/paohuzi/15/watermark.png", rules ="规则简介：10胡起胡，大胡翻倍，可多次翻醒，\n可自摸、可放炮，放炮包赔。桂林特色玩法。"}, 
    [16]={ id=16, name="碰胡子", type=1, friends=7, number =4, playerCount = "4,3", isZuoXing4=0, icon="game/paohuzi/16/icon.png", icons="game/paohuzi/16/icon1.png", icon1="game/paohuzi/16/icon2.png", icon8="game/paohuzi/16/icon8.png", ruleBtn="game/paohuzi/16/rule.png;game/paohuzi/16/rule_1.png", ruleCSB="http://share.hy.qilaigame.com/rule/wanfa/16.html", imgSynopsiss="game/paohuzi/16/names.png", imgSynopsis="game/paohuzi/16/name.png", luaCreateRoomFile="RoomCreateLayer16", luaGameFile="game.paohuzi.16.GameLayer", imgDesk="game/paohuzi/16/watermark.png", rules ="规则简介：4人同玩，无息也可胡牌，有碰即可得分，五福要报警，\n否则算平胡，双龙见牌就倒，天胡消龙消坎，但不消双龙和小七对。"}, 
    [17]={ id=17, name="邵阳剥皮", type=1, friends=7, number =3, playerCount = "3", isZuoXing4=0, icon="game/paohuzi/17/icon.png", icons="game/paohuzi/17/icon1.png", icon1="game/paohuzi/17/icon2.png", icon8="game/paohuzi/17/icon8.png", ruleBtn="game/paohuzi/17/rule.png;game/paohuzi/17/rule_1.png", ruleCSB="http://share.hy.qilaigame.com/rule/wanfa/17.html", imgSynopsiss="game/paohuzi/17/names.png", imgSynopsis="game/paohuzi/17/name.png", luaCreateRoomFile="RoomCreateLayer17", luaGameFile="game.paohuzi.17.GameLayer", imgDesk="game/paohuzi/17/watermark.png", rules ="规则简介：10胡起胡，有红黑胡，放炮包赔，10胡牌3囤，\n11胡牌1囤，12胡2囤，15胡3囤（15胡息后每3胡息加一屯）。"}, 
    [20]={ id=20, name="娄底放炮罚", type=1, friends=7, number =3, playerCount = "3", isZuoXing4=0, icon="game/paohuzi/20/icon.png", icons="game/paohuzi/20/icon1.png", icon1="game/paohuzi/20/icon2.png", icon8="game/paohuzi/20/icon8.png", ruleBtn="game/paohuzi/20/rule.png;game/paohuzi/20/rule_1.png", ruleCSB="http://share.hy.qilaigame.com/rule/wanfa/20.html", imgSynopsiss="game/paohuzi/20/names.png", imgSynopsis="game/paohuzi/20/name.png", luaCreateRoomFile="RoomCreateLayer20", luaGameFile="game.paohuzi.20.GameLayer", imgDesk="game/paohuzi/20/watermark.png", rules ="规则简介：15胡起胡，好友房百胡结算,休闲场单局结算，黄庄庄家\n减10胡，（乌胡、红胡、天胡、卡胡、地胡）算百胡，放炮必胡。"}, 
    [21]={ id=21, name="红点黑", type=1, friends=7, number =3, playerCount = "3", isZuoXing4=0, icon="game/paohuzi/21/icon.png", icons="game/paohuzi/21/icon1.png", icon1="game/paohuzi/21/icon2.png", icon8="game/paohuzi/21/icon8.png", ruleBtn="game/paohuzi/21/rule.png;game/paohuzi/21/rule_1.png", ruleCSB="http://share.hy.qilaigame.com/rule/wanfa/21.html", imgSynopsiss="game/paohuzi/21/names.png", imgSynopsis="game/paohuzi/21/name.png", luaCreateRoomFile="RoomCreateLayer0", luaGameFile="game.paohuzi.21.GameLayer", imgDesk="game/paohuzi/21/watermark.png", rules ="规则简介：15胡起胡，红胡胡息*2，点胡胡息*2，乌胡胡息*2，\n天胡胡息*2，地胡胡息*2,15胡息以后，每3胡息加一囤。"}, 
    [22]={ id=22, name="衡东六胡抢", type=1, friends=7, number =4, playerCount = "4,3", isZuoXing4=0, icon="game/paohuzi/22/icon.png", icons="game/paohuzi/22/icon1.png", icon1="game/paohuzi/22/icon2.png", icon8="game/paohuzi/22/icon8.png", ruleBtn="game/paohuzi/22/rule.png;game/paohuzi/22/rule_1.png", ruleCSB="http://share.hy.qilaigame.com/rule/wanfa/22.html", imgSynopsiss="game/paohuzi/22/names.png", imgSynopsis="game/paohuzi/22/name.png", luaCreateRoomFile="RoomCreateLayer22", luaGameFile="game.paohuzi.22.GameLayer", imgDesk="game/paohuzi/22/watermark.png", rules ="规则简介：六胡枪玩的是抢而不是大（蚂蚁上树），6胡起\n胡，一胡一囤，红胡（2番），黑胡（2番），自摸（2番）。"},
    [23]={ id=23, name="祁东六胡抢", type=1, friends=7, number =4, playerCount = "4,3", isZuoXing4=0, icon="game/paohuzi/23/icon.png", icons="game/paohuzi/23/icon1.png", icon1="game/paohuzi/23/icon2.png", icon8="game/paohuzi/23/icon8.png", ruleBtn="game/paohuzi/23/rule.png;game/paohuzi/23/rule_1.png", ruleCSB="http://share.hy.qilaigame.com/rule/wanfa/23.html", imgSynopsiss="game/paohuzi/23/names.png", imgSynopsis="game/paohuzi/23/name.png", luaCreateRoomFile="RoomCreateLayer23", luaGameFile="game.paohuzi.23.GameLayer", imgDesk="game/paohuzi/23/watermark.png", rules ="规则简介：六胡枪玩的是抢而不是大，胡息数达到6胡并符合\n胡牌牌型就可胡牌。无一五十吃法，有红黑胡。"},
    [24]={ id=24, name="衡阳十胡卡", type=1, friends=7, number =3, playerCount = "3,2", isZuoXing4=0, icon="game/paohuzi/24/icon.png", icons="game/paohuzi/24/icon1.png", icon1="game/paohuzi/24/icon2.png", icon8="game/paohuzi/24/icon8.png", ruleBtn="game/paohuzi/24/rule.png;game/paohuzi/24/rule_1.png", ruleCSB="http://share.hy.qilaigame.com/rule/wanfa/24.html", imgSynopsiss="game/paohuzi/24/names.png", imgSynopsis="game/paohuzi/24/name.png", luaCreateRoomFile="RoomCreateLayer24", luaGameFile="game.paohuzi.24.GameLayer", imgDesk="game/paohuzi/24/watermark.png", rules ="规则简介：10胡起胡，有红黑胡，放炮包赔，10胡牌3囤，\n11胡牌1囤，12胡2囤，15胡3囤（15胡息后每3胡息加一囤）。"}, 
    [25]={ id=25, name="跑得快15张", type=2, friends=7, number =3, playerCount = "3,2", isZuoXing4=0, icon="game/puke/25/icon.png", icons="game/puke/25/icon1.png", icon1="game/puke/25/icon2.png", icon8="game/puke/25/icon8.png", ruleBtn="game/puke/25/rule.png;game/puke/25/rule_1.png", ruleCSB="http://share.hy.qilaigame.com/rule/wanfa/25.html", imgSynopsiss="game/puke/25/names.png", imgSynopsis="game/puke/25/name.png", luaCreateRoomFile="RoomCreateLayer25", luaGameFile="game.puke.25.GameLayer", imgDesk="game/puke/25/watermark.png", rules ="规则简介：3人玩法，去掉大小王、方块2梅花2红桃2方块A梅花A红\n桃A方块K，共45张牌，每人15张，黑桃3先出（必须带黑桃3）。"}, 
    [26]={ id=26, name="跑得快16张", type=2, friends=7, number =3, playerCount = "3,2", isZuoXing4=0, icon="game/puke/26/icon.png", icons="game/puke/26/icon1.png", icon1="game/puke/26/icon2.png", icon8="game/puke/26/icon8.png", ruleBtn="game/puke/26/rule.png;game/puke/26/rule_1.png", ruleCSB="http://share.hy.qilaigame.com/rule/wanfa/26.html", imgSynopsiss="game/puke/26/names.png", imgSynopsis="game/puke/26/name.png", luaCreateRoomFile="RoomCreateLayer25", luaGameFile="game.puke.26.GameLayer", imgDesk="game/puke/26/watermark.png", rules ="规则简介：3人玩法，去掉大小王、方块2梅花2红桃2方块A，共48张\n牌，每人16张，首局黑桃3先出。第二局开始由上游先出牌。"}, 
    [27]={ id=27, name="江永十五张", type=1, friends=7, number =4, playerCount = "3,2,4", isZuoXing4=0, icon="game/paohuzi/27/icon.png", icons="game/paohuzi/27/icon1.png", icon1="game/paohuzi/27/icon2.png", icon8="game/paohuzi/27/icon8.png", ruleBtn="game/paohuzi/27/rule.png;game/paohuzi/27/rule_1.png", ruleCSB="http://share.hy.qilaigame.com/rule/wanfa/27.html", imgSynopsiss="game/paohuzi/27/names.png", imgSynopsis="game/paohuzi/27/name.png", luaCreateRoomFile="RoomCreateLayer27", luaGameFile="game.paohuzi.27.GameLayer", imgDesk="game/paohuzi/27/watermark.png", rules ="规则简介：6胡起胡，1张王霸，王霸可以代替任何牌，有王霸可以\n不必胡，王霸不能打出，有翻醒跟醒，黄庄有王霸需赔王霸钱。"}, 
    [31]={ id=31, name="永州扯胡子", type=1, friends=7, number =3, playerCount = "3,2,4", isZuoXing4=1, icon="game/paohuzi/31/icon.png", icons="game/paohuzi/31/icon1.png", icon1="game/paohuzi/31/icon2.png", icon8="game/paohuzi/31/icon8.png", ruleBtn="game/paohuzi/31/rule.png;game/paohuzi/31/rule_1.png", ruleCSB="http://share.hy.qilaigame.com/rule/wanfa/31.html", imgSynopsiss="game/paohuzi/31/names.png", imgSynopsis="game/paohuzi/31/name.png", luaCreateRoomFile="RoomCreateLayer31", luaGameFile="game.paohuzi.31.GameLayer", imgDesk="game/paohuzi/31/watermark.png", rules ="规则简介：15胡起胡，2张王霸，王霸可以代替任何牌，有王霸只\n能自摸，王霸不能打出，有翻醒跟醒，黄庄有王霸需赔王霸钱。"}, 
    [32]={ id=32, name="双人扯胡子", type=1, friends=7, number =3, playerCount = "2", isZuoXing4=0, icon="game/paohuzi/32/icon.png", icons="game/paohuzi/32/icon1.png", icon1="game/paohuzi/32/icon2.png", icon8="game/paohuzi/32/icon8.png", ruleBtn="game/paohuzi/32/rule.png;game/paohuzi/32/rule_1.png", ruleCSB="http://share.hy.qilaigame.com/rule/wanfa/32.html", imgSynopsiss="game/paohuzi/32/names.png", imgSynopsis="game/paohuzi/32/name.png", luaCreateRoomFile="RoomCreateLayer32", luaGameFile="game.paohuzi.32.GameLayer", imgDesk="game/paohuzi/32/watermark.png", rules ="规则简介：15胡起胡，1张王霸，王霸可以代替任何牌，有王霸只\n能自摸，王霸不能打出，有翻醒跟醒，黄庄有王霸需赔王霸钱。"}, 
    [33]={ id=33, name="单王扯胡子", type=1, friends=7, number =3, playerCount = "3,2,4", isZuoXing4=1, icon="game/paohuzi/33/icon.png", icons="game/paohuzi/33/icon1.png", icon1="game/paohuzi/33/icon2.png", icon8="game/paohuzi/33/icon8.png", ruleBtn="game/paohuzi/33/rule.png;game/paohuzi/33/rule_1.png", ruleCSB="http://share.hy.qilaigame.com/rule/wanfa/33.html", imgSynopsiss="game/paohuzi/33/names.png", imgSynopsis="game/paohuzi/33/name.png", luaCreateRoomFile="RoomCreateLayer33", luaGameFile="game.paohuzi.33.GameLayer", imgDesk="game/paohuzi/33/watermark.png", rules ="规则简介：15胡起胡，1张王霸，王霸可以代替任何牌，有王霸只\n能自摸，王霸不能打出，有翻醒跟醒，黄庄有王霸需赔王霸钱。"}, 
    [34]={ id=34, name="祁阳落地扫", type=1, friends=7, number =4, playerCount = "4,2,3", isZuoXing4=0, icon="game/paohuzi/34/icon.png", icons="game/paohuzi/34/icon1.png", icon1="game/paohuzi/34/icon2.png", icon8="game/paohuzi/34/icon8.png", icon10="game/paohuzi/34/icon10.png", ruleBtn="game/paohuzi/34/rule.png;game/paohuzi/34/rule_1.png", ruleCSB="http://share.hy.qilaigame.com/rule/wanfa/34.html", imgSynopsiss="game/paohuzi/34/names.png", imgSynopsis="game/paohuzi/34/name.png", luaCreateRoomFile="RoomCreateLayer34", luaGameFile="game.paohuzi.34.GameLayer", imgDesk="game/paohuzi/34/watermark.png", rules ="规则简介：6胡起胡，1张王霸，王霸可以代替任何牌，有王霸可以\n不必胡，王霸不能打出，有翻醒跟醒，黄庄有王霸需赔王霸钱。"}, 
    [35]={ id=35, name="三王扯胡子", type=1, friends=7, number =3, playerCount = "3,2,4", isZuoXing4=1, icon="game/paohuzi/35/icon.png", icons="game/paohuzi/35/icon1.png", icon1="game/paohuzi/35/icon2.png", icon8="game/paohuzi/35/icon8.png", ruleBtn="game/paohuzi/35/rule.png;game/paohuzi/35/rule_1.png", ruleCSB="http://share.hy.qilaigame.com/rule/wanfa/35.html", imgSynopsiss="game/paohuzi/35/names.png", imgSynopsis="game/paohuzi/35/name.png", luaCreateRoomFile="RoomCreateLayer33", luaGameFile="game.paohuzi.35.GameLayer", imgDesk="game/paohuzi/35/watermark.png", rules ="规则简介：15胡起胡，3张王霸，王霸可以代替任何牌，有王霸只\n能自摸，王霸不能打出，有翻醒跟醒，黄庄有王霸需赔王霸钱。"}, 
    [36]={ id=36, name="双王扯胡子", type=1, friends=7, number =3, playerCount = "3,2,4", isZuoXing4=1, icon="game/paohuzi/36/icon.png", icons="game/paohuzi/36/icon1.png", icon1="game/paohuzi/36/icon2.png", icon8="game/paohuzi/36/icon8.png", ruleBtn="game/paohuzi/36/rule.png;game/paohuzi/36/rule_1.png", ruleCSB="http://share.hy.qilaigame.com/rule/wanfa/36.html", imgSynopsiss="game/paohuzi/36/names.png", imgSynopsis="game/paohuzi/36/name.png", luaCreateRoomFile="RoomCreateLayer33", luaGameFile="game.paohuzi.36.GameLayer", imgDesk="game/paohuzi/36/watermark.png", rules ="规则简介：15胡起胡，2张王霸，王霸可以代替任何牌，有王霸只\n能自摸，王霸不能打出，有翻醒跟醒，黄庄有王霸需赔王霸钱。"}, 
    [37]={ id=37, name="四王扯胡子", type=1, friends=7, number =3, playerCount = "3,2,4", isZuoXing4=1, icon="game/paohuzi/37/icon.png", icons="game/paohuzi/37/icon1.png", icon1="game/paohuzi/37/icon2.png", icon8="game/paohuzi/37/icon8.png", icon10="game/paohuzi/37/icon10.png", ruleBtn="game/paohuzi/37/rule.png;game/paohuzi/37/rule_1.png", ruleCSB="http://share.hy.qilaigame.com/rule/wanfa/37.html", imgSynopsiss="game/paohuzi/37/names.png", imgSynopsis="game/paohuzi/37/name.png", luaCreateRoomFile="RoomCreateLayer37", luaGameFile="game.paohuzi.37.GameLayer", imgDesk="game/paohuzi/37/watermark.png", rules ="规则简介：15胡起胡，4张王霸，王霸可以代替任何牌，有王霸只\n能自摸，王霸不能打出，有翻醒跟醒，黄庄有王霸需赔王霸钱。"}, 
    [38]={ id=38, name="十五胡抢", type=1, friends=7, number =3, playerCount = "3", isZuoXing4=0, icon="game/paohuzi/38/icon.png", icons="game/paohuzi/38/icon1.png", icon1="game/paohuzi/38/icon2.png", icon8="game/paohuzi/38/icon8.png", ruleBtn="game/paohuzi/38/rule.png;game/paohuzi/38/rule_1.png", ruleCSB="http://share.hy.qilaigame.com/rule/wanfa/38.html", imgSynopsiss="game/paohuzi/38/names.png", imgSynopsis="game/paohuzi/38/name.png", luaCreateRoomFile="RoomCreateLayer38", luaGameFile="game.paohuzi.38.GameLayer", imgDesk="game/paohuzi/38/watermark.png", rules ="规则简介：15胡起胡，每多3胡息加一囤，有红黑点胡，\n翻垛跟垛，正宗家乡味。"}, 
    [39]={ id=39, name="耒阳字牌", type=1, friends=7, number =3, playerCount = "3,2", isZuoXing4=0, icon="game/paohuzi/39/icon.png", icons="game/paohuzi/39/icon1.png", icon1="game/paohuzi/39/icon2.png", icon8="game/paohuzi/39/icon8.png", ruleBtn="game/paohuzi/39/rule.png;game/paohuzi/39/rule_1.png", ruleCSB="http://share.hy.qilaigame.com/rule/wanfa/39.html", imgSynopsiss="game/paohuzi/39/names.png", imgSynopsis="game/paohuzi/39/name.png", luaCreateRoomFile="RoomCreateLayer39", luaGameFile="game.paohuzi.39.GameLayer", imgDesk="game/paohuzi/39/watermark.png", rules ="规则简介：10胡起胡,小卡胡(10胡)算16胡,大卡胡(20胡)算24胡,\n10胡牌3囤,11胡牌1囤,12胡2囤,15胡3囤(15胡息后每3胡息加一囤)。"}, 
    [40]={ id=40, name="衡阳六胡抢", type=1, friends=7, number =4, playerCount = "4,3", isZuoXing4=0, icon="game/paohuzi/40/icon.png", icons="game/paohuzi/40/icon1.png", icon1="game/paohuzi/40/icon2.png", icon8="game/paohuzi/40/icon8.png", ruleBtn="game/paohuzi/40/rule.png;game/paohuzi/40/rule_1.png", ruleCSB="http://share.hy.qilaigame.com/rule/wanfa/40.html", imgSynopsiss="game/paohuzi/40/names.png", imgSynopsis="game/paohuzi/40/name.png", luaCreateRoomFile="RoomCreateLayer40", luaGameFile="game.paohuzi.40.GameLayer", imgDesk="game/paohuzi/40/watermark.png", rules ="规则简介：六胡枪玩的是抢而不是大，胡息数达到6胡并符合\n胡牌牌型就可胡牌。有一五十吃法，没有红黑胡。"},
    [42]={ id=42, name="溆浦老牌", type=3, friends=1, number =4, playerCount = "4", isZuoXing4=0, icon="game/laopai/42/icon.png", icons="game/laopai/42/icon1.png", icon1="game/laopai/42/icon2.png", icon8="game/laopai/42/icon8.png", ruleBtn="game/laopai/42/rule.png;game/laopai/42/rule_1.png", ruleCSB="http://share.hy.qilaigame.com/rule/42.html", imgSynopsiss="game/laopai/42/names.png", imgSynopsis="game/laopai/42/name.png",luaCreateRoomFile="RoomCreateLayer42", luaGameFile="game.laopai.42.GameLayer", imgDesk="game/laopai/42/watermark.png",rules ="规则"},
    [43]={ id=43, name="溆浦跑胡子", type=1, friends=1, number =3, playerCount = "3", isZuoXing4=0, icon="game/paohuzi/43/icon.png", icons="game/paohuzi/43/icon1.png", icon1="game/paohuzi/43/icon2.png", icon8="game/paohuzi/43/icon8.png", ruleBtn="game/paohuzi/43/rule.png;game/paohuzi/43/rule_1.png", ruleCSB="http://share.hy.qilaigame.com/rule/43.html", imgSynopsiss="game/paohuzi/43/names.png", imgSynopsis="game/paohuzi/43/name.png", luaCreateRoomFile="RoomCreateLayer43", luaGameFile="game.paohuzi.43.GameLayer", imgDesk="game/paohuzi/43/watermark.png",rules ="规则"},
    [44]={ id=44, name="怀化红拐弯", type=1, friends=7, number =4, playerCount = "3,2,4", isZuoXing4=1, icon="game/paohuzi/44/icon.png", icons="game/paohuzi/44/icon1.png", icon1="game/paohuzi/44/icon2.png", icon8="game/paohuzi/44/icon8.png", ruleBtn="game/paohuzi/44/rule.png;game/paohuzi/44/rule_1.png", ruleCSB="http://share.hy.qilaigame.com/rule/wanfa/44.html", imgSynopsiss="game/paohuzi/44/names.png", imgSynopsis="game/paohuzi/44/name.png", luaCreateRoomFile="RoomCreateLayer44", luaGameFile="game.paohuzi.44.GameLayer", imgDesk="game/paohuzi/44/watermark.png", rules ="规则简介：18胡起胡，15胡可自摸胡牌或有名堂胡牌，\n大小字胡4番起，名堂多样，玩法独特。"},
    [45]={ id=45, name="红中麻将", type=3, friends=7, number =4, playerCount = "4,2,3", isZuoXing4=0, icon="game/majiang/45/icon.png", icons="game/majiang/45/icon1.png", icon1="game/majiang/45/icon2.png", icon8="game/majiang/45/icon8.png", ruleBtn="game/majiang/45/rule.png;game/majiang/45/rule_1.png", ruleCSB="http://share.hy.qilaigame.com/rule/wanfa/45.html", imgSynopsiss="game/majiang/45/names.png", imgSynopsis="game/majiang/45/name.png", luaCreateRoomFile="RoomCreateLayer45", luaGameFile="game.majiang.45.GameLayer", imgDesk="game/majiang/45/watermark.png", rules ="规则简介：4张红中，红中可以代替任何牌，红中不能打出，\n起手4张红中可以直接胡牌。只能自摸，不准接炮。"},  
    [46]={ id=46, name="转转麻将", type=3, friends=7, number =4, playerCount = "4,2,3", isZuoXing4=0, icon="game/majiang/46/icon.png", icons="game/majiang/46/icon1.png", icon1="game/majiang/46/icon2.png", icon8="game/majiang/46/icon8.png", ruleBtn="game/majiang/46/rule.png;game/majiang/46/rule_1.png", ruleCSB="http://share.hy.qilaigame.com/rule/wanfa/46.html", imgSynopsiss="game/majiang/46/names.png", imgSynopsis="game/majiang/46/name.png", luaCreateRoomFile="RoomCreateLayer46", luaGameFile="game.majiang.46.GameLayer", imgDesk="game/majiang/46/watermark.png", rules ="规则简介：可自摸、可接炮，明杠3倍底分，暗杠每人2倍底分，公\n杠1倍底分。自摸2倍底分，中鸟加倍。不能跟胡。只算一五九为鸟。"},
    [47]={ id=47, name="常德红黑点", type=1, friends=7, number =3, playerCount = "3,2,4", isZuoXing4=1, icon="game/paohuzi/47/icon.png", icons="game/paohuzi/47/icon1.png", icon1="game/paohuzi/47/icon2.png", icon8="game/paohuzi/47/icon8.png", ruleBtn="game/paohuzi/47/rule.png;game/paohuzi/47/rule_1.png", ruleCSB="http://share.hy.qilaigame.com/rule/wanfa/47.html", imgSynopsiss="game/paohuzi/47/names.png", imgSynopsis="game/paohuzi/47/name.png", luaCreateRoomFile="RoomCreateLayer47", luaGameFile="game.paohuzi.47.GameLayer", imgDesk="game/paohuzi/47/watermark.png", rules ="规则简介：15胡起胡，经典玩法，红胡、黑胡、点胡，不能接炮，\n只能胡牌墩上的牌。"}, 
    [48]={ id=48, name="常德全名堂", type=1, friends=7, number =3, playerCount = "3,2,4", isZuoXing4=1, icon="game/paohuzi/48/icon.png", icons="game/paohuzi/48/icon1.png", icon1="game/paohuzi/48/icon2.png", icon8="game/paohuzi/48/icon8.png", ruleBtn="game/paohuzi/48/rule.png;game/paohuzi/48/rule_1.png", ruleCSB="http://share.hy.qilaigame.com/rule/wanfa/48.html", imgSynopsiss="game/paohuzi/48/names.png", imgSynopsis="game/paohuzi/48/name.png", luaCreateRoomFile="RoomCreateLayer48", luaGameFile="game.paohuzi.48.GameLayer", imgDesk="game/paohuzi/48/watermark.png", rules ="规则简介：15胡起胡，红胡、黑胡、对对胡、大字胡、小子胡、\n黄番、耍猴等多种名堂，不能接炮，只能胡牌墩上的牌。"}, 
    [49]={ id=49, name="常德多红对", type=1, friends=7, number =3, playerCount = "3,2,4", isZuoXing4=1, icon="game/paohuzi/49/icon.png", icons="game/paohuzi/49/icon1.png", icon1="game/paohuzi/49/icon2.png", icon8="game/paohuzi/49/icon8.png", ruleBtn="game/paohuzi/49/rule.png;game/paohuzi/49/rule_1.png", ruleCSB="http://share.hy.qilaigame.com/rule/wanfa/49.html", imgSynopsiss="game/paohuzi/49/names.png", imgSynopsis="game/paohuzi/49/name.png", luaCreateRoomFile="RoomCreateLayer49", luaGameFile="game.paohuzi.49.GameLayer", imgDesk="game/paohuzi/49/watermark.png", rules ="规则简介：15胡起胡，乌对胡、红对胡等多种特色名堂，\n独特地区玩法，原滋原味，回味无穷。"}, 
    [50]={ id=50, name="长沙麻将", type=3, friends=7, number =4, playerCount = "4", isZuoXing4=0, icon="game/majiang/50/icon.png", icons="game/majiang/50/icon1.png", icon1="game/majiang/50/icon2.png", icon8="game/majiang/50/icon8.png", ruleBtn="game/majiang/50/rule.png;game/majiang/50/rule_1.png", ruleCSB="http://share.hy.qilaigame.com/rule/wanfa/50.html", imgSynopsiss="game/majiang/50/names.png", imgSynopsis="game/majiang/50/name.png", luaCreateRoomFile="RoomCreateLayer50", luaGameFile="game.majiang.50.GameLayer", imgDesk="game/majiang/50/watermark.png", rules ="规则简介：胡牌必须有二五八做将，可吃、可碰、可杠、\n可补，胡牌名堂多样变化，胡牌分庄家和闲家。"},
    [51]={ id=51, name="经典双十", type=2, friends=1, number =6, playerCount = "6", isZuoXing4=0, icon="game/puke/51/icon.png", icons="game/puke/51/icon1.png", icon1="game/puke/51/icon2.png", icon8="game/puke/51/icon8.png", ruleBtn="game/puke/51/rule.png;game/puke/51/rule_1.png", ruleCSB="http://share.hy.qilaigame.com/rule/wanfa/51.html", imgSynopsiss="game/puke/51/names.png", imgSynopsis="game/puke/51/name.png", luaCreateRoomFile="RoomCreateLayer51", luaGameFile="game.puke.51.GameLayer", imgDesk="game/puke/51/watermark.png", rules ="规则"}, 
    [52]={ id=52, name="溆浦麻将", type=3, friends=1, number =6, playerCount = "4,2,3", isZuoXing4=0, icon="game/majiang/52/icon.png", icon1="game/majiang/52/icon1.png", icons="game/majiang/52/icon2.png", icon8="game/majiang/52/icon8.png", ruleBtn="game/majiang/52/rule.png;game/majiang/52/rule_1.png", ruleCSB="http://share.hy.qilaigame.com/rule/52.html", imgSynopsiss="game/majiang/52/names.png", imgSynopsis="game/majiang/52/name.png", luaCreateRoomFile="RoomCreateLayer52", luaGameFile="game.majiang.52.GameLayer", imgDesk="game/majiang/52/watermark.png" , rules ="规则"},
    [53]={ id=53, name="三公", type=2, friends=1, number =4, playerCount = "6", isZuoXing4=0, icon="game/puke/53/icon.png", icons="game/puke/53/icon1.png", icon1="game/puke/53/icon2.png", icon8="game/puke/53/icon8.png", ruleBtn="game/puke/51/rule.png;game/puke/51/rule_1.png", ruleCSB="http://share.hy.qilaigame.com/rule/wanfa/53.html", imgSynopsiss="game/puke/53/names.png", imgSynopsis="game/puke/53/name.png", luaCreateRoomFile="RoomCreateLayer53", luaGameFile="game.puke.53.GameLayer", imgDesk="game/puke/53/watermark.png", rules ="规则"}, 
    [54]={ id=54, name="驻马店麻将", type=3, friends=1, number =4, playerCount = "4", isZuoXing4=0, icon="game/majiang/54/icon.png", icons="game/majiang/54/icon1.png", icon1="game/majiang/54/icon2.png", icon8="game/majiang/54/icon8.png", ruleBtn="game/majiang/54/rule.png;game/majiang/54/rule_1.png", ruleCSB="http://share.hy.qilaigame.com/rule/wanfa/54.html", imgSynopsiss="game/majiang/54/names.png", imgSynopsis="game/majiang/54/name.png", luaCreateRoomFile="RoomCreateLayer54", luaGameFile="game.majiang.54.GameLayer", imgDesk="game/majiang/54/watermark.png", rules ="规则简介：4张红中，红中可以代替任何牌，红中不能打出，\n起手4张红中可以直接胡牌。只能自摸，不准接炮。"},  
    [55]={ id=55, name="八人牛牛", type=2, friends=1, number =6, playerCount = "6", isZuoXing4=0, icon="game/puke/55/icon.png", icons="game/puke/55/icon1.png", icon1="game/puke/55/icon2.png", icon8="game/puke/55/icon8.png", ruleBtn="game/puke/55/rule.png;game/puke/55/rule_1.png", ruleCSB="http://share.hy.qilaigame.com/rule/wanfa/51.html", imgSynopsiss="game/puke/55/names.png", imgSynopsis="game/puke/55/name.png", luaCreateRoomFile="RoomCreateLayer55", luaGameFile="game.puke.55.GameLayer", imgDesk="game/puke/55/watermark.png", rules ="规则"}, 
    [60]={ id=60, name="汉寿跑胡子", type=1, friends=7, number =3, playerCount = "3,2,4", isZuoXing4=1, icon="game/paohuzi/60/icon.png", icons="game/paohuzi/60/icon1.png", icon1="game/paohuzi/60/icon2.png", icon8="game/paohuzi/60/icon8.png", ruleBtn="game/paohuzi/60/rule.png;game/paohuzi/60/rule_1.png", ruleCSB="http://share.hy.qilaigame.com/rule/wanfa/60.html", imgSynopsiss="game/paohuzi/60/names.png", imgSynopsis="game/paohuzi/60/name.png", luaCreateRoomFile="RoomCreateLayer60", luaGameFile="game.paohuzi.60.GameLayer", imgDesk="game/paohuzi/60/watermark.png", rules ="规则简介：15胡起胡，红胡、黑胡、对对胡、大字胡、小子胡、\n黄番、耍猴等多种名堂，不能接炮，只能胡牌墩上的牌。"}, 
    [61]={ id=61, name="广东麻将", type=3, friends=7, number =4, playerCount = "4", isZuoXing4=0, icon="game/majiang/61/icon.png", icons="game/majiang/61/icon1.png", icon1="game/majiang/61/icon2.png", icon8="game/majiang/61/icon8.png", ruleBtn="game/majiang/61/rule.png;game/majiang/61/rule_1.png", ruleCSB="http://share.hy.qilaigame.com/rule/wanfa/61.html", imgSynopsiss="game/majiang/61/names.png", imgSynopsis="game/majiang/61/name.png", luaCreateRoomFile="RoomCreateLayer61", luaGameFile="game.majiang.61.GameLayer", imgDesk="game/majiang/61/watermark.png", rules ="规则简介：可自摸、可接炮，明杠3倍底分，暗杠每人2倍底分，公\n杠1倍底分。自摸2倍底分，中鸟加倍。不能跟胡。只算一五九为鸟。"},
    [63]={ id=63, name="土匪麻将", type=3, friends=7, number =4, playerCount = "4", isZuoXing4=0, icon="game/majiang/63/icon.png", icons="game/majiang/63/icon1.png", icon1="game/majiang/63/icon2.png", icon8="game/majiang/63/icon8.png", ruleBtn="game/majiang/63/rule.png;game/majiang/63/rule_1.png", ruleCSB="http://share.hy.qilaigame.com/rule/wanfa/63.html", imgSynopsiss="game/majiang/63/names.png", imgSynopsis="game/majiang/63/name.png", luaCreateRoomFile="RoomCreateLayer45", luaGameFile="game.majiang.63.GameLayer", imgDesk="game/majiang/63/watermark.png", rules ="规则简介：8张红中，红中可以代替任何牌，红中不能打出，\n起手4张红中可以直接胡牌。只能自摸，不准接炮。"},  
    [65]={ id=65, name="宜春麻将", type=3, friends=1, number =4, playerCount = "4", isZuoXing4=0, icon="game/majiang/65/icon.png", icons="game/majiang/65/icon1.png", icon1="game/majiang/65/icon2.png", icon8="game/majiang/65/icon8.png", ruleBtn="game/majiang/65/rule.png;game/majiang/65/rule_1.png", ruleCSB="http://share.hy.qilaigame.com/rule/wanfa/65.html", imgSynopsiss="game/majiang/65/names.png", imgSynopsis="game/majiang/65/name.png", luaCreateRoomFile="RoomCreateLayer65", luaGameFile="game.majiang.65.GameLayer", imgDesk="game/majiang/65/watermark.png", rules ="规则简介：8张红中，红中可以代替任何牌，红中不能打出，\n起手4张红中可以直接胡牌。只能自摸，不准接炮。"},  
    [67]={ id=67, name="王钓麻将", type=3, friends=7, number =4, playerCount = "4", isZuoXing4=0, icon="game/majiang/67/icon.png", icons="game/majiang/67/icon1.png", icon1="game/majiang/67/icon2.png", icon8="game/majiang/67/icon8.png", ruleBtn="game/majiang/63/rule.png;game/majiang/67/rule_1.png", ruleCSB="http://share.hy.qilaigame.com/rule/wanfa/63.html", imgSynopsiss="game/majiang/67/names.png", imgSynopsis="game/majiang/67/name.png", luaCreateRoomFile="RoomCreateLayer67", luaGameFile="game.majiang.67.GameLayer", imgDesk="game/majiang/67/watermark.png", rules ="规则简介：8张红中，红中可以代替任何牌，红中不能打出，\n起手4张红中可以直接胡牌。只能自摸，不准接炮。"},   
    [68]={ id=68, name="红中麻将", type=3, friends=7, number =4, playerCount = "4,2,3", isZuoXing4=0, icon="game/majiang/68/icon.png", icons="game/majiang/68/icon1.png", icon1="game/majiang/68/icon2.png", icon8="game/majiang/68/icon8.png", ruleBtn="game/majiang/68/rule.png;game/majiang/68/rule_1.png", ruleCSB="http://share.hy.qilaigame.com/rule/wanfa/68.html", imgSynopsiss="game/majiang/68/names.png", imgSynopsis="game/majiang/68/name.png", luaCreateRoomFile="RoomCreateLayer68", luaGameFile="game.majiang.68.GameLayer", imgDesk="game/majiang/68/watermark.png", rules ="规则简介：4张红中，红中可以代替任何牌，红中不能打出，\n起手4张红中可以直接胡牌。只能自摸，不准接炮。"},   
    [70]={ id=70, name="长沙麻将", type=3, friends=7, number =4, playerCount = "4", isZuoXing4=0, icon="game/majiang/70/icon.png", icons="game/majiang/70/icon1.png", icon1="game/majiang/70/icon2.png", icon8="game/majiang/70/icon8.png", ruleBtn="game/majiang/70/rule.png;game/majiang/70/rule_1.png", ruleCSB="http://share.hy.qilaigame.com/rule/wanfa/70.html", imgSynopsiss="game/majiang/70/names.png", imgSynopsis="game/majiang/70/name.png", luaCreateRoomFile="RoomCreateLayer70", luaGameFile="game.majiang.70.GameLayer", imgDesk="game/majiang/70/watermark.png", rules ="规则简介：胡牌必须有二五八做将，可吃、可碰、可杠、\n可补，胡牌名堂多样变化，胡牌分庄家和闲家。"},
  
}

return Games


