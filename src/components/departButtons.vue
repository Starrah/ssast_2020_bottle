<template>
    <view class="nav-list">
        <navigator hover-class="none" @click="navigateToForm"
                   class="nav-li wide bg-blue" navigateTo
                   :style="[{animation: 'show ' + ((1)*0.2+1) + 's 1'}]" >
            <view class="nav-title">点击前往填写报名问卷</view>
        </navigator>
        <navigator v-for="(item,index) in elements" :key="index" v-if="index !== excludeIndex"
                   hover-class="none" :url="`/pages/result?result=${index}`"
                   class="nav-li" navigateTo :class="'bg-' + item.color"
                   :style="[{animation: 'show ' + ((index+2)*0.2+1) + 's 1'}]" >
            <view class="nav-title">{{item.title}}</view>
            <view class="nav-name">{{item.name}}</view>
        </navigator>
    </view>
</template>

<script lang="ts">
    import {Component, Prop} from "vue-property-decorator";
    import Vue from 'vue';

    @Component
    export default class DepartButtons extends Vue{
        @Prop({type: Number, default: -1})excludeIndex: number;
        elements: Array<{
            title: string,
            name: string,
            color: string,
        }> = [
            {
                title: '常务部',
                name: 'Coordination',
                color: 'red',
            },
            {
                title: '技术部',
                name: 'Technology',
                color: 'cyan',
            },
            {
                title: '赛事部',
                name: 'Game',
                color: 'orange',
            },
            {
                title: '项目部',
                name: 'Project',
                color: 'green',
            }
        ];

        navigateToForm(){
            window.location.href = "https://www.wjx.cn/jq/59367245.aspx";
        }
    }
</script>

<style scoped>
    .nav-list {
        display: flex;
        flex-wrap: wrap;
        padding: 0 10px;
        justify-content: space-between;
    }

    .nav-li.wide{
        padding: 12px 10px;
        width: 100%!important;
        display: flex;
        justify-content: center;
        margin-bottom: 10px;
    }

    .nav-li {
        padding: 10px;
        border-radius: 12upx;
        width: 30%;
        margin: 0;
        background-image: url(../static/departbtn_mask.png);
        background-size: cover;
        background-position: center;
        position: relative;
        z-index: 1;
    }

    .nav-li::after {
        content: "";
        position: absolute;
        z-index: -1;
        background-color: inherit;
        width: 100%;
        height: 100%;
        left: 0;
        bottom: -10%;
        border-radius: 10upx;
        opacity: 0.2;
        transform: scale(0.9, 0.9);
    }

    .nav-li.cur {
        color: #fff;
        background: rgb(94, 185, 94);
        box-shadow: 4upx 4upx 6upx rgba(94, 185, 94, 0.4);
    }

    .nav-title {
        font-size: 32upx;
        font-weight: 300;
    }

    .nav-title::first-letter {
        font-size: 40upx;
        margin-right: 4upx;
    }

    .nav-name {
        font-size: 28upx;
        text-transform: Capitalize;
        margin-top: 20upx;
        position: relative;
    }

    .nav-name::before {
        content: "";
        position: absolute;
        display: block;
        width: 40upx;
        height: 6upx;
        background: #fff;
        bottom: 0;
        right: 0;
        opacity: 0.5;
    }

    .nav-name::after {
        content: "";
        position: absolute;
        display: block;
        width: 100upx;
        height: 1px;
        background: #fff;
        bottom: 0;
        right: 40upx;
        opacity: 0.3;
    }

    .nav-name::first-letter {
        font-weight: bold;
        font-size: 36upx;
        margin-right: 1px;
    }

    .nav-li text {
        position: absolute;
        right: 30upx;
        top: 30upx;
        font-size: 52upx;
        width: 60upx;
        height: 60upx;
        text-align: center;
        line-height: 60upx;
    }

    .text-light {
        font-weight: 300;
    }

    @keyframes show {
        0% {
            transform: translateY(-50px);
        }

        60% {
            transform: translateY(40upx);
        }

        100% {
            transform: translateY(0px);
        }
    }

    @-webkit-keyframes show {
        0% {
            transform: translateY(-50px);
        }

        60% {
            transform: translateY(40upx);
        }

        100% {
            transform: translateY(0px);
        }
    }
</style>