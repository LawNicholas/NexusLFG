<template>
  <!--<div class="col-md-12">
    <div class="card card-container">
      
      <form name="form" @submit.prevent="handleRegister">
        <div>
          <div class="form-group">
            <label for="username">Name</label>
            <input
              v-model="name"
              type="text"
              class="form-control"
              name="name"
            />
          </div>
          <div class="form-group">
            <label for="email">Email</label>
            <input
              v-model="email"
              type="email"
              class="form-control"
              name="email"
            />
          </div>
          <div class="form-group">
            <label for="password">Password</label>
            <input
              v-model="password"
              type="password"
              class="form-control"
              name="password"
            />
          </div>
          <div class="form-group">
            <button class="btn btn-primary btn-block" :disabled="loading">
              <span
                v-show="loading"
                class="spinner-border spinner-border-sm"
              ></span>
              <span>Sign Up</span>
            </button>
          </div>
        </div>
      </form>
    </div>
  </div>-->

  <div>
    <form>
      <span>Select game first: </span>
      <select v-model="game">
        <option disabled value="">Please select one</option>
        <option v-for="g in games" :key="g.gameid" v-bind:value="{ id: g.gameid }">
            {{ g.gamename }}
        </option>
      </select>
      <br>

      <span>Select game mode: </span>
      <select v-model="mode">
        <option disabled value="">Please select one</option>
        <option v-for="m in filterModes(modes, game)" :key="m.modeid" v-bind:value="{ id: m.modeid }">
            {{ m.modename }}
        </option>
      </select>
      <br>

      <span>Select game region: </span>
      <select v-model="region">
        <option disabled value="">Please select one</option>
        <option v-for="r in filterRegions(regions, game)" :key="r.regionid" v-bind:value="{ id: r.regionid }">
            {{ r.regionname }}
        </option>
      </select>
      <br>

      <span>Select game rank: </span>
      <select v-model="rank">
        <option disabled value="">Please select one</option>
        <option v-for="r in filterRanks(ranks, game)" :key="r.rankid" v-bind:value="{ id: r.rankid }">
            {{ r.rankname }}
        </option>
      </select>
      <br>

      <span>Select game role: </span>
      <select v-model="role">
        <option disabled value="">Please select one</option>
        <option v-for="r in filterRoles(roles, game)" :key="r.roleid" v-bind:value="{ id: r.roleid }">
            {{ r.rolename }}
        </option>
      </select>
      <br>
      <v-btn @click="createProfile()"
        :style="{left: '50%', transform:'translateX(-50%)'}"
      >
        Submit
      </v-btn>
    </form>

  </div>
</template>

<script>
import Api from "../api";
import { getJwtToken } from '../auth';

export default {
  name: "CreateGameProfile",
  /*
  data: function () {
    return {
      loading: false,
      games: [],
      modes: [],
      regions: [],
      ranks: [],
      game: '',
      mode: '',
      region: '',
      rank: '',
    };
  },
  */
  data: () => ({
    loading: false,
    games: [],
    modes: [],
    regions: [],
    ranks: [],
    roles: [],
    game: '',
    mode: '',
    region: '',
    rank: '',
    role: '',
  }),
  methods: {
    filterModes: function(items, game) {
      return items.filter(function(m) {
        return m.gameid == game.id;
      })
    },
    filterRegions: function(items, game) {
      return items.filter(function(r) {
        return r.gameid == game.id;
      })
    },
    filterRanks: function(items, game) {
      return items.filter(function(r) {
        return r.gameid == game.id;
      })
    },
    filterRoles: function(items, game) {
      return items.filter(function(r) {
        return r.gameid == game.id;
      })
    },
    async createProfile() {
      let token = getJwtToken();
      await Api.createProfile(token, this.role.id, this.region.id, this.rank.id, this.mode.id);
      this.$router.push("/gameprofiles");
    },
  },
  created: function () {
    this.loading = true;
    Api.getGames().then((res) => {
      this.games = res.data;
      this.loading = false;
    });
    Api.getModes().then((res) => {
      this.modes = res.data;
      this.loading = false;
    });
    Api.getRegions().then((res) => {
      this.regions = res.data;
      this.loading = false;
    });
    Api.getRanks().then((res) => {
      this.ranks = res.data;
      this.loading = false;
    });
    Api.getRoles().then((res) => {
      this.roles = res.data;
      this.loading = false;
    });
  },
};
</script>