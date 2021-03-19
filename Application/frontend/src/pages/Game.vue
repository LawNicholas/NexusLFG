<template>
    <div>
        <ol>
            <li v-for="g in games" :key="g.gameid">
                <a>{{
                    g.gamename
                }}</a>
            </li>
        </ol>
    </div>
</template>

<script>
import Api from "../api";

export default {
  name: "Home",
  data: function () {
    return {
      loading: false,
      games: [],
    };
  },
  created: function () {
    this.loading = true;
    Api.getGames().then((res) => {
      this.games = res.data;
      this.loading = false;
    });
  },
};
</script>