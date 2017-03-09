<template>
  <div id="app">
    <!--<img src="./assets/logo.png">-->
    <!--<hello></hello>-->
    <propert></propert>
    <!--<el-button type="primary">click me</el-button>-->
  </div>
</template>

<script>
import Hello from './components/Hello'
import Propert from './components/Propert'

export default {
  name: 'app',
  components: {
    Hello,Propert
  }
}
</script>
