<template>
  <div>
    {{msg}}
    <el-button>this is from propert</el-button>
  </div>
</template>

<script>
  export default {
    name: 'propert',
    data() {
      return {
        msg: 'this is propert msg',
        //文本文件内容
        file_content: '',
        file_name: '',
        debug_msg: '',
        comment_msg: '',
        message: 'Hello Vue!',
        aios_properties_content: ` this is a test`,
        propert_list: [{
            "comment": "commt1",
            "key": "key1",
            "value": "value1"
          },
          {
            "comment": "commt2",
            "key": "kkey2",
            "value": "value2"
          }
        ],
        options: [{
          value: '选项1',
          label: '黄金糕'
        }, {
          value: '选项2',
          label: '双皮奶'
        }, {
          value: '选项3',
          label: '蚵仔煎'
        }, {
          value: '选项4',
          label: '龙须面'
        }, {
          value: '选项5',
          label: '北京烤鸭'
        }],
        ro_wakeup_exclude_command_options: [{
            "label": "查看全程",
            "value": "cha kan quan cheng"
          },
          {
            "label": "全程概览",
            "value": "quan cheng gai lan"
          },
          {
            "label": "躲避拥堵",
            "value": "duo bi yong du"
          },
          {
            "label": "高速优先",
            "value": "gao su you xian"
          },
          {
            "label": "少收费",
            "value": "shao shou fei"
          },
          {
            "label": "避免收费",
            "value": "bi mian shou fei"
          },
          {
            "label": "不走高速",
            "value": "bu zou gao su"
          },
          {
            "label": "返回导航",
            "value": "fan hui dao hang"
          },
          {
            "label": "怎么走",
            "value": "zen me zou"
          },
          {
            "label": "往哪儿走",
            "value": "wang na er zou"
          },
          {
            "label": "哪条路",
            "value": "na tiao lu"
          },
          {
            "label": "还有多少",
            "value": "hai you duo shao"
          },
          {
            "label": "还有多久",
            "value": "hai you duo jiu"
          },
          {
            "label": "还要多久",
            "value": "hai yao duo jiu"
          },
          {
            "label": "退出导航",
            "value": "tui chu dao hang"
          },
          {
            "label": "结束导航",
            "value": "jie shu dao hang"
          },
          {
            "label": "关闭导航",
            "value": "guan bi dao hang"
          },
          {
            "label": "停止导航",
            "value": "ting zhi dao hang"
          },
          {
            "label": "放大地图",
            "value": "fang da di tu"
          },
          {
            "label": "缩小地图",
            "value": "suo xiao di tu"
          },
          {
            "label": "车头朝上",
            "value": "che tou chao shang"
          },
          {
            "label": "北朝上",
            "value": "bei chao shang"
          },
          {
            "label": "北向上",
            "value": "bei xiang shang"
          },
          {
            "label": "关闭路况",
            "value": "guan bi lu kuang"
          },
          {
            "label": "打开路况",
            "value": "da kai lu kuang"
          },
          {
            "label": "白天模式",
            "value": "bai tian mo shi"
          },
          {
            "label": "日间模式",
            "value": "ri jian mo shi"
          },
          {
            "label": "夜间模式",
            "value": "ye jian mo shi"
          },
          {
            "label": "黑夜模式",
            "value": "hei ye mo shi"
          },
          {
            "label": "2D模式",
            "value": "er di mo shi"
          },
          {
            "label": "3D模式",
            "value": "san di mo shi"
          },
          {
            "label": "车头向上",
            "value": "che tou xiang shang"
          },
          {
            "label": "完毕完毕",
            "value": "wan bi wan bi"
          },
          {
            "label": "回复微信",
            "value": "hui fu wei xin"
          },
          {
            "label": "取消播报",
            "value": "qv xiao bo bao"
          },
          {
            "label": "注销微信",
            "value": "zhu xiao wei xin"
          },
          {
            "label": "继续发送微信",
            "value": "ji xv fa song wei xin"
          },
          {
            "label": "我要拍照",
            "value": "wo yao pai zhao"
          },
          {
            "label": "关闭屏幕",
            "value": "guan bi ping mu"
          },
          {
            "label": "打开屏幕",
            "value": "da kai ping mu"
          },
          {
            "label": "增大音量",
            "value": "zeng da yin liang"
          },
          {
            "label": "减小音量",
            "value": "jian xiao yin liang"
          },
          {
            "label": "调亮屏幕",
            "value": "tiao liang ping mu"
          },
          {
            "label": "调暗屏幕",
            "value": "tiao an ping mu"
          },
          {
            "label": "打开声音",
            "value": "da kai sheng yin"
          },
          {
            "label": "关闭声音",
            "value": "guan bi sheng yin"
          },
          {
            "label": "快速拍照",
            "value": "kuai su pai zhao"
          },
          {
            "label": "返回桌面",
            "value": "fan hui zhuo mian"
          },
          {
            "label": "返回主页",
            "value": "fan hui zhu ye"
          },
          {
            "label": "上一首",
            "value": "shang yi shou"
          },
          {
            "label": "下一首",
            "value": "xia yi shou"
          },
          {
            "label": "暂停播放",
            "value": "zan ting bo fang"
          },
          {
            "label": "继续播放",
            "value": "ji xv bo fang"
          },
          {
            "label": "播放音乐",
            "value": "bo fang yin yue"
          },
        ],
        ro_wakeup_exclude_command_value: [],
        value5: [],
        propert_values: {},
      }
    }
  }

</script>
