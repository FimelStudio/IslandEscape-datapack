$dialog show @s {\
    "pause": false,\
    "title": {\
        "text": "            编辑吞噬的感染体",\
        "color": "dark_red",\
        "shadow_color":0\
    },\
    "body": [\
        {\
            "type": "plain_message",\
            "contents": [\
            {\
                "type": "text",\
                "text": "当前感染体：\n\n",\
                "color": "white"\
            },\
            {\
                "type": "object",\
                "player": "$(player_name)",\
                "object": "player"\
            },\
            {\
                "text": " $(player_name)",\
                "color": "white"\
            }]\
        },\
        {\
            "type": "plain_message",\
            "contents": {\
                "text": "血量越高体型越大、速度越慢；血量越低体型越小、速度越快。"\
            }\
        }\  
    ],\
    "inputs": [\
        {\
            "type": "minecraft:number_range",\
            "label": "感染体血量",\
            "key": "config_health",\
            "start": 6,\
            "end": 40,\
            "step": 1,\
            "initial": $(max_health),\
        }\
    ],\
    "type": "confirmation",\
    "no": {\
        "label": {"text": "取消", "color": "white"},\
        "tooltip": {"text": "不修改当前感染体"}\
    },\
    "yes": {\
        "label": {"text": "应用", "color": "dark_red"},\
        "tooltip": {"text": "按血量重算体型和速度"},\
        "action": {\
            "type": "dynamic/run_command",\
            "template": "trigger ie.eat_health set $(config_health)"\
        }\
    }\
}
