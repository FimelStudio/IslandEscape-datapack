$dialog show @s {\
    "pause": false,\
    "title": {\
        "text": "编辑感染体属性",\
        "color": "red"\
    },\
    "body": [\
        {\
            "type": "plain_message",\
            "contents": [\
                {\
                    "text": "当前感染者：",\
                    "color": "white"\
                },\
                {\
                    "type": "object",\
                    "object": "player",\
                    "player": "$(player_name)"\
                },\
                {\
                    "text": " ",\
                },\
                {\
                    "text": "$(player_name)"\
                }\
            ]\
        },\
    ],\
    "inputs": [\
        {\
            "type": "minecraft:number_range",\
            "label": "更改血量(影响速度和体型)",\
            "key": "config_health",\
            "start": 5,\
            "end": 35,\
            "step": 1,\
            "initial": $(max_health)\
        }\
    ],\
    "type": "confirmation",\
    "no": {\
        "label": {\
            "text": "取消编辑",\
            "color": "white"\
        },\
        "tooltip": {\
            "text": "点击退出"\
        }\
    },\
    "yes": {\
        "label": {\
            "text": "确定编辑",\
            "color": "dark_red"\
        },\
        "tooltip": {\
            "text": "点击确定"\
        },\
        "action": {\
            "type": "run_command",\
            "command": "attribute @a[tag=eated_zombie,limit=1] max_health base set 6"\
        }\
    }\
}