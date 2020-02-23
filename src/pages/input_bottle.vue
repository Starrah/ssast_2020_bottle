<template>
    <div>
        <img src="../static/p2_title.png"
             style="position:relative; width: 70%; left: 15%; margin-top: 10%; margin-bottom: 2%;" />
        <div style="display: flex; flex-wrap: wrap; justify-content: space-around;">
            <bottle v-for="(item, index) in bottleList" :key="item.word" v-model="item.value" :word="item.word"
                    :lineIndex="Math.floor(index / 5)" :columnIndex="index % 5"
                    style="width: calc((100% - 40px)/5); margin: 10px 0;" />
        </div>
        <div style="display: flex; justify-content: center">
            <button class="cu-btn bg-gradual-green radius" @click="toResult"
                    style="margin-top: 20px; padding: 5px 30px;font-size: 25px;height: 50px;">提交</button>
        </div>
    </div>

</template>

<script lang="ts">
    import {Component} from "vue-property-decorator";
    import Vue from 'vue';
    import Bottle from "@/components/bottle.vue";


    @Component({
        components: {
            bottle: Bottle
        }
    })
    export default class InputBottle extends Vue{
        name = "input_bottle";
        KEYWORDS_LIST: Array<string> = [
            "沟通", "组织", "宣传", "技术", "美工",
            "严谨", "酷炫", "实践", "挑战性", "奇思妙想",
            "学术", "科创", "竞赛", "AI/CV", "技术分享",
            "前端开发", "后端开发", "游戏开发", "运维", "新技术",
            "PS", "推送排版", "视频剪辑", "财务管理", "赛事运营"
        ];
        bottleList: Array<{
            word: string,
            value: number
        }> = (() => {
            let res = [];
            for(let word of this.KEYWORDS_LIST){
                res.push({
                    word: word,
                    value: 0
                })
            }
            return res;
        })();

        toResult(){
            uni.navigateTo({
                url: "/pages/result?result=0&showBottle=true",
            })
        }
    }
</script>

<style scoped>

</style>
