<script setup>
const props = defineProps({
  title: String,
  description: String,
});
</script>
<template>
  <div class="card">
    <header class="card-header">
      <p class="card-header-title">{{ title }}</p>
    </header>
    <div class="card-content">
      <div class="meeting-description">
        {{ description }}
      </div>
    </div>
  </div>
</template>