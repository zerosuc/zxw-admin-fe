<template>
  <div>
    <span class="w-icon" style="position: absolute; z-index: 9999; padding: 3px 15px 0">
      <SvgIcon :name="metaData.icon" />
    </span>
    <el-select v-model="metaData.icon" class="w-select" style="width: 100%" clearable filterable placeholder="请选择">
      <el-option
        v-for="item in options"
        :key="item.key"
        class="select__option_item"
        :label="item.key"
        :value="item.key"
      >
        <span class="zxw-icon" style="padding: 3px 0 0">
          <SvgIcon :name="item.label" />
        </span>
        <span style="text-align: left">{{ item.key }}</span>
      </el-option>
    </el-select>
  </div>
</template>

<script lang="ts" setup>
import { ref, reactive } from "vue"

const props = defineProps({
  meta: {
    default: function () {
      return {}
    },
    type: Object
  }
})

const options = reactive([
  { key: "dashboard", label: "dashboard" },
  { key: "setting", label: "setting" },
  { key: "lock", label: "lock" },
  { key: "menu", label: "menu" },
  { key: "bug", label: "bug" },
  { key: "network", label: "network" },
  { key: "plus", label: "plus" },
  { key: "load", label: "load" },
  { key: "config", label: "config" },
  { key: "link", label: "link" },
  { key: "access", label: "access" },
  { key: "file", label: "file" },
  { key: "monitor", label: "monitor" }
])

const metaData = ref(props.meta)
</script>

<style>
.w-icon {
  color: rgb(132, 146, 166);
  font-size: 14px;
  margin-right: 10px;
}

.w-select .el-input__inner {
  padding: 0 30px !important;
}

.select__option_item {
  display: flex;
  align-items: center;
  justify-content: flex-start;
}
</style>
