<template>
    <div>
        <div v-if="showBottle">
            <img :src="RESULT_TITLE_LIST[resultIndex]"
                 style="position:relative; width: 70%; left: 15%; margin-top: 10%; margin-bottom: 2%;" />
            <div style="display: flex; flex-wrap: wrap; justify-content: space-around;">
                <bottle v-for="(item, index) in bottleList" :key="item.word" v-model="item.value" :word="item.word"
                        :lineIndex="Math.floor(index / 5)" :columnIndex="index % 5"
                        :changeable="false"
                        style="width: calc((100% - 40px)/5); margin: 10px 0;" />
            </div>
        </div>
        <div style="margin-top: 20px; position: relative; width: 100%; height: 300px; background-color: #f9d7ea">
            <h3>介绍卡片示例，可以根据推送改写</h3>
        </div>
        <div style="display: flex; justify-content: space-around">
            <button v-for="index in [0,1,2,3]" v-if="index !== resultIndex" :key="index"
                    style="margin-top: 20px; width: 30%; background: transparent; padding: 0" class="myButton"
                    @click="">
                <img :src="RESULT_BUTTON_LIST[index]" style="width: 100%;" />
            </button>
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
    export default class Result extends Vue{
        name = "result";
        showBottle: boolean;
        resultIndex: number;
        onLoad(param){
            this.showBottle = !!param.showBottle;
            this.resultIndex = Number(param.result);
        }
        RESULT_TITLE_LIST = [
            "../static/p3_title_cwb.png",
            "../static/p3_title_cwb.png",
            "../static/p3_title_cwb.png",
            "../static/p3_title_cwb.png",
        ];
        RESULT_BUTTON_LIST = [
            "../static/p3_btn_cwb.png",
            "../static/p3_btn_cwb.png",
            "../static/p3_btn_cwb.png",
            "../static/p3_btn_cwb.png",
        ];
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
                    value: 1
                })
            }
            return res;
        })();
    }
</script>

<style scoped>
    /*覆盖uniapp自带的按钮边框*/
    button.myButton:after{
        width: 0;
        height: 0;
        border: none;
    }

    button.myButton:active{
        transform: translate(10px, 10px);
    }
</style>
