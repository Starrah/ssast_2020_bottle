<template>
    <div @click="toNextPage" style="position: absolute; width: 100%; height: 100%">
        <h1 style="position: absolute; left: 15%; top: 45%;">点击进入</h1>
    </div>
</template>

<script lang="ts">
    import {Component} from "vue-property-decorator";
    import Vue from 'vue';

    @Component
    export default class IndexPage extends Vue{
        name = "index";
        toNextPage(){
            uni.navigateTo({
                url: "/pages/input_bottle",
            })
        }
    }
</script>

<style scoped>

</style>