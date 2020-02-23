<template>
    <div>
        <div class="stage1 hide-right" ref="stage1">
            <div class="bg" style="position: fixed; background-image: url('../static/p2_bg.jpg')"></div>
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
        <div class="stage2" ref="stage2">
            <div class="bg" style="background-image: url('../static/p1_bg.jpg')"></div>
            <img @click="hideStage2"  src="../static/p1_startbtn.png"  style="position: absolute; width: 57%; left: 21.5%; top: 64%;" alt="" />
            <img @click="navigateToForm" src="../static/p1_jumpbtn.png" style="position: absolute; width: 52.3%; left: 23.7%; top: 85%" alt="" />
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
            getApp().globalData["bottleList"] = this.bottleList;
            this.hideStage1();
            setTimeout(()=>{
                uni.navigateTo({
                    url: `/pages/result?result=${this.calculateResultIndex()}&showBottle=true`,
                })
            }, 500);
        }

        MODEL = [
            [4, 4, 5, 3, 5, 3, 5, 3, 2, 5, 0, 1, 0, 1, 2, 3, 1, 1, 2, 3, 5, 5, 3, 5, 0],
            [3, 2, 0, 5, 2, 4, 4, 5, 5, 2, 0, 1, 0, 3, 5, 5, 5, 4, 5, 4, 0, 0, 0, 0, 0],
            [0, 3, 5, 2, 5, 1, 5, 2, 4, 5, 0, 2, 5, 0, 5, 2, 0, 5, 2, 5, 1, 0, 3, 0, 5],
            [5, 5, 4, 3, 0, 5, 5, 4, 4, 4, 5, 5, 4, 5, 4, 1, 1, 0, 2, 3, 0, 1, 0, 0, 5]
        ];

        calculateResultIndex(){
            let resArr = [];
            for(let oneModel of this.MODEL){
                let oneVal = 0;
                for(let i=0;i<oneModel.length;i++){
                    oneVal += Math.abs(oneModel[i] - this.bottleList[i].value);
                }
                resArr.push(oneVal);
            }
            let minValue = 1000;
            let minIndex = 0;
            for(let i=0;i<resArr.length;i++){
                if(resArr[i] < minValue){
                    minValue = resArr[i];
                    minIndex = i;
                }
            }
            return minIndex;
        }

        hideStage1(){
            (this.$refs.stage1 as HTMLDivElement).classList.add("hide-top");
        }

        hideStage2(){
            (this.$refs.stage2 as HTMLDivElement).classList.add("hide-left");
            (this.$refs.stage1 as HTMLDivElement).classList.remove("hide-right")
        }

        navigateToForm(){
            window.location.href = "https://www.wjx.cn/jq/59367245.aspx";
        }
    }
</script>

<style scoped>
    div.stage1{
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
    }
    div.stage2{
        position: fixed;
        width: 100%;
        height: 100%;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
    }
    div.bg{
        position: absolute;
        width: 100%;
        height: 100%;
        left: 0;
        top: 0;
        background-repeat: no-repeat;
        background-position: center 0;
        background-size: cover;
    }
    div.stage1 div.bg{
        z-index: -2;
    }
    div.stage2 div.bg{
        z-index: -1;
    }
    div.stage1.hide-left,
    div.stage2.hide-left{
        left: auto;
        right: 100%;
        transition: right ease-in-out 0.5s
    }
    div.stage1.hide-right,
    div.stage2.hide-right{
        right: auto;
        left: 100%;
        transition: right ease-in-out 0.5s
    }
    div.stage1.hide-top,
    div.stage2.hide-top{
        top: auto;
        bottom: 100%;
        transition: bottom ease-in-out 0.5s
    }
</style>
