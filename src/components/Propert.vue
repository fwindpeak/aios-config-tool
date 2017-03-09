<template>
  <div>
    <el-row justify="left">
      <el-col>
        <input type="file" id="file" @change="onOpenClick();" />
      </el-col>
    </el-row>

    <el-row justify="left">
      <el-col :span="6">
        <div class="grid-content bg-purple">key</div>
      </el-col>
      <el-col :span="10">
        <div class="grid-content bg-purple-dark">value</div>
      </el-col>
      <el-col :span="8">
        <div class="grid-content bg-purple">说明</div>
      </el-col>
    </el-row>
    <div v-for="(pt,index) in propert_list" :key="pt.key">
      <el-row justify="left">
        <el-col :span="6" justify="right">
          <div>{{pt.key}}</div>
        </el-col>
        <el-col :span="10">
          <div v-if="check_ro_wakeup_exclude_command(pt.key,pt.value)">
            <el-select style="width: 90%;" v-model="pt.value" multiple placeholder="请选择">
              <el-option v-for="item in ro_wakeup_exclude_command_options" :label="item.label" :value="item.value" :key="item.value">
              </el-option>
            </el-select>
          </div>
          <div v-else-if="pt.key == 'ro_modules_include'">
            <div v-for="(v,k) in pt.value">
              <div>
                <el-row>
                  <el-col :span="10">{{k}}</el-col>
                  <el-col :span="4">
                    <el-switch v-model="pt.value[k]" on-text="true" off-text="false">
                    </el-switch>
                  </el-col>
                </el-row>
              </div>
            </div>
          </div>
          <div v-else-if="pt.key == 'ro_wakeup_major'">
            <el-table :data="pt.value" style="width: 100%">
              <el-table-column prop="name" label="name" width="180">
                <template scope="scope">
                  <el-input v-model="scope.row.name"></el-input>
                </template>
              </el-table-column>
              <el-table-column prop="pinyin" label="pinyin" width="180">
                <template scope="scope">
                  <el-input v-model="scope.row.pinyin"></el-input>
                </template>
              </el-table-column>
              <el-table-column prop="threshold" label="threshold">
                <template scope="scope">
                  <el-input v-model="scope.row.threshold"></el-input>
                </template>
              </el-table-column>
            </el-table>
          </div>
          <div v-else-if="pt.key == 'ro_tts_param'">
            <el-table :data="pt.value" style="width: 100%">
              <el-table-column prop="res" label="res" width="180">
              </el-table-column>
              <el-table-column prop="volume" label="volume" width="180">
                <template scope="scope">
                  <el-input v-model="scope.row.volume"></el-input>
                </template>
              </el-table-column>
              <el-table-column prop="speechrate" label="speechrate">
                <template scope="scope">
                  <el-input v-model="scope.row.speechrate"></el-input>
                </template>
              </el-table-column>
            </el-table>
          </div>
          <div v-else-if='check_switch(pt.key,pt.value)'>
            <el-switch v-model="pt.value" on-text="true" off-text="false">
            </el-switch>
          </div>
          <div v-else-if='pt.key == "tts_res" '>
            <el-select v-model="pt.value">
              <el-option :label="'lin-zhi-lin'" :value="'lin-zhi-lin'"></el-option>
              <el-option :label="'guo-de-gang'" :value="'guo-de-gang'"></el-option>
            </el-select>
          </div>
          <div v-else>
            <el-input type="text" v-model="pt.value" style="width: 90%;"></el-input>
          </div>
        </el-col>
        <el-col :span="8">
          <div>{{pt.comment}}</div>
        </el-col>
      </el-row>
    </div>
    <el-button type="primary" @click="onSaveClick();">另存为</el-button>
  </div>
</template>

<script>
  import FileSaver from './FileSaver.js'

  export default {
    name: 'propert',
    data() {
      return {
        msg: 'this is propert msg',
        //文本文件内容
        file_content: '',
        //内容是否改动
        is_propert_changed: false,
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
    },
    watch: {
      propert_list: function () {
        console.log("propert_list changed");
        self.is_propert_changed = true;
      }
    },
    mounted: function () {
      if (typeof String.prototype.startsWith != 'function') {
        String.prototype.startsWith = function (prefix) {
          return this.slice(0, prefix.length) === prefix;
        };
      }
      if (typeof String.prototype.endsWith != 'function') {
        String.prototype.endsWith = function (suffix) {
          return this.indexOf(suffix, this.length - suffix.length) !== -1;
        };
      }
      String.prototype.trim = function () {　　
        return this.replace(/(^\s*)|(\s*$)/g, "");　　
      }
    },
    methods: {
      onOpenClick: function () {
        let self = this;
        let file = document.getElementById("file").files[0];
        // console.log(file);
        if (file != undefined) {
          let fileName = document.getElementById("file").value;
          console.log(fileName);
          fileName = fileName.split('\\');
          fileName = fileName[fileName.length - 1];
          self.file_name = fileName;
          let reader = new FileReader();
          reader.readAsText(file);
          reader.onload = function (e) {
            self.file_content = this.result;
            self.readFileContentToJson();
          }
        } else {
          self.file_name = '';
        }
        self.is_propert_changed = false;
      },
      onSaveClick: function () {
        let self = this;
        if (self.file_name == '') {
          alert('没有打开文件');
          return;
        }
        console.log(self.file_name);
        self.jsonToFileContent();
        let blob = new Blob([self.file_content], {
          type: "text/plain;charset=utf-8"
        });
        FileSaver.saveAs(blob, self.file_name);
      },
      jsonToFileContent: function () {
        let self = this;
        self.file_content = self.comment_msg;
        self.propert_list.forEach(function (p) {
          self.file_content += "## " + p.comment + '\n'
          let pv = p.value;
          if (self.check_json(p.key, p.value)) {
            pv = JSON.stringify(pv);
          }
          self.file_content += p.key + ' = ' + pv + '\n\n';
        });
      },
      readFileContentToJson: function () {
        let self = this;
        self.propert_list = [];
        self.comment_msg = '';

        let isStart = true;
        if (self.file_name == 'aios.properties') {
          isStart = false;
        }
        let p = {
          "comment": "",
          "key": "",
          "value": ""
        };
        self.file_content.split('\n').forEach(function (line) {

          if (isStart == false) {
            if (line.indexOf("必选配置") != -1) {
              isStart = true;
            } else {
              self.comment_msg += line + "\n";
            }
            return;
          }
          if (line.startsWith("#")) {
            if (line.startsWith("#####")) {
              return;
            }
            if (p.comment.length > 1) {
              p.comment += "  ";
            }
            p.comment += line.replace(/(^#+ *)/g, '');
          } else if (line.length > 1) {
            let v = line.split('=');
            p.key = v[0].trim();
            p.value = v[1].trim();
            if (p.key == 'ro_wakeup_exclude_command') {
              p.value = p.value.split(',');
            } else if (self.check_switch(p.key, p.value)) {
              p.value = (p.value == 'true');
            } else if (self.check_json(p.key, p.value)) {
              p.value = JSON.parse(p.value);
            }
            self.propert_list.push(p);
            p = {
              "comment": "",
              "key": "",
              "value": ""
            };
          }

        });
        // console.log(this.file_content);
        self.copy_propert_values();
      },
      copy_propert_values: function () {
        let self = this;
        self.propert_values = {};
        self.propert_list.forEach(function (e) {
          self.propert_values[e.key] = e.value;
        });
      },
      check_ro_wakeup_exclude_command: function (key, value) {
        if (key != 'ro_wakeup_exclude_command') {
          return false;
        }
        return true;
      },
      check_switch: function (key, value) {
        if (typeof (value) == "boolean") {
          return true;
        } else if (value == 'true' || value == 'false') {
          return true;
        } else {
          return false;
        }
      },
      check_text: function (key, value) {
        // if(value){
        console.log(key + value);
        this.propert_values[key] = value;
        // }
        return true;
      },
      check_num: function (key, value) {
        return true;
      },
      check_json: function (key, value) {
        //暂时只判断key
        if (key === 'ro_modules_include' || key == 'ro_tts_param' || key == 'ro_wakeup_major') {
          return true;
        } else {
          return false;
        }
      }
    },
  }

</script>

<style scoped>
  .el-row {
    margin-bottom: 20px;
    &:last-child {
      margin-bottom: 0;
    }
  }
  
  .el-col {
    border-radius: 4px;
  }
  
  .bg-purple-dark {
    background: #99a9bf;
  }
  
  .bg-purple {
    background: #d3dce6;
  }
  
  .bg-purple-light {
    background: #e5e9f2;
  }
  
  .grid-content {
    border-radius: 4px;
    min-height: 36px;
  }
  
  .row-bg {
    padding: 10px 0;
    background-color: #f9fafc;
  }

</style>
