<script setup>
import { ref, onMounted } from "vue";
import VueCookies from "vue-cookies";
import axios from "axios";
import DashboardHeader from "../../components/header/DashboardHeader.vue";
import Card from "./Card.vue";

const userId = $cookies.get("user_id");
const jwtToken = $cookies.get("token");

let meetings = ref();

onMounted(() => {
  axios
    .get(
      `http://localhost:1323/api/restricted/meetings/guest/not-yet-responded/${userId}`,
      {
        headers: {
          Authorization: `Bearer ${jwtToken}`,
        },
      }
    )
    .then((response) => {
      meetings.value = response.data;
    })
    .catch((err) => {
      console.log(err);
    });
});
</script>

<template>
  <div>
    <header>
      <DashboardHeader></DashboardHeader>
      <section class="hero is-primary is-fullheight">
        <div class="hero-body">
          <div class="container">
            <div class="columns is-centered">
              <div class="column is-half is-4">
                <li
                  v-for="meeting in meetings"
                  :key="meeting.id"
                >
                  <Card
                    :id="meeting.id"
                    :title="meeting.title"
                    :description="meeting.description"
                    :type="meeting.type"
                    :place="meeting.place"
                    :url="meeting.url"
                  ></Card>
                  <br>
                </li>
              </div>
            </div>
          </div>
        </div>
      </section>
    </header>
  </div>
</template>

<style scoped>
li {
  list-style: none;
}
</style>