<template>
    <div class="bottle-container">
        <div :class="{ 'bottle': true, 'bottle-clicked': bottleClicked }"
            :style="'background-image: ' + backgroundImageUrl()"
            @mousedown="bottleImageOnMouseDown"
            @click="bottleImageOnClick">
        </div>
        {{ word }}
        <!--= {{ theValue }} ({{ lineIndex }}, {{ columnIndex }})-->
    </div>
</template>

<script lang="ts">
    import {Component, Prop} from "vue-property-decorator";
    import Vue from 'vue';

    @Component
    export default class Bottle extends Vue{
        name = "bottle";
        @Prop({type: Boolean, default: true})changeable: boolean;
        @Prop({type: String, default: ""})word: string;
        @Prop({type: Number, default: 0})value: number;//切莫直接调整此value的值，请使用setter！
        @Prop({type: Number, default: 0})lineIndex: number;//0~4
        @Prop({type: Number, default: 0})columnIndex: number;//0~4

        theValue: number = 0;
        bottleClicked: boolean = false;

        created() {
            this.theValue = this.value;
        }

        //点击后修改value时，请调用此函数。
        setValue(newValue: number){
            this.$emit("input", newValue);
            //注：不能直接修改prop的值，而是通过向外发送事件、属性传回来实现才可以。
            //父对象保证监听此setValue事件从而修改value的值、
        }

        backgroundImageUrl() {
            return 'url(../static/bottle_' +
                (this.value === 0 ? '' : this.lineIndex.toString()) +
                this.value + '.png)';
        }

        bottleImageOnMouseDown(e) {
            this.bottleClicked = false;
        }

        bottleImageOnClick(e) {
            if (this.changeable) {
                this.theValue = (this.theValue + 1) % 6;
                this.bottleClicked = true;
            }
            this.setValue(this.theValue);
        }
    }
</script>

<style scoped>
.bottle-container {
  background: transparent;
  text-align: center;
  font-size: 16px;
}
.bottle {
  background-size: cover;
  position: relative;
  bottom: 0;
  left: 50%;
  width: 70px;
  height: 70px;
  transform: translate(-50%, 0) scaleX(1) scaleY(1);
  transition: transform ease 0.12s;
}
.bottle.bottle-clicked {
  animation: bottle-squeeze 0.17s cubic-bezier(.23,.8,.3,2.22);
}
.bottle:active {
  transform: translate(-50%, 0) scaleX(1) scaleY(1);
}
.bottle:active:hover {
  transform: translate(-50%, 0) scaleX(1.06) scaleY(0.95);
}
@keyframes bottle-squeeze {
    0% { transform: translate(-50%, 0) scaleX(1.06) scaleY(0.95); }
  100% { transform: translate(-50%, 0) scaleX(1) scaleY(1); }
}

.bottle:after {
  content: "";
  background: url('../static/bottle_pop.png');
  background-size: cover;
  display: block;
  position: absolute;
  top: 47%;
  left: 50%;
  transform: translate(-50%, -50%);
  width: 60px;
  height: 60px;
  opacity: 0;
}
.bottle.bottle-clicked:after {
  animation: bottle-pop 0.16s;
}
@keyframes bottle-pop {
    0% { opacity: 1; transform: translate(-50%, -50%) scale(1); }
  100% { opacity: 0; transform: translate(-50%, -50%) scale(1.5); }
}
</style>
