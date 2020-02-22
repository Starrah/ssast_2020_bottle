<template>
    <div>
<!--        我的测试用代码，你删掉即可~-->
        <img src="../static/logo.png" style="width: 100%" />
    </div>
</template>

<script lang="ts">
    import {Component, Prop} from "vue-property-decorator";
    import Vue from 'vue';

    @Component
    export default class Bottle extends Vue{
        name = "bottle";
        @Prop({type: String, default: ""})word: string;
        @Prop({type: Number, default: 0})value: number;//切莫直接调整此value的值，请使用setter！
        @Prop({type: Number, default: 0})lineIndex: number;//0~4
        @Prop({type: Number, default: 0})columnIndex: number;//0~4

        //点击后修改value时，请调用此函数。
        setValue(newValue: number){
            this.$emit("input", newValue);
            //注：不能直接修改prop的值，而是通过向外发送事件、属性传回来实现才可以。
            //父对象保证监听此setValue事件从而修改value的值、
        }
    }
</script>

<style scoped>

</style>