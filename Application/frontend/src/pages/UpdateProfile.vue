<template>
    <div id='update-profile' v-if="fetched">
        <a>
            Game: {{ profile_expanded[0].gamename }}<br>
            Mode: {{ profile_expanded[0].modename }}
        </a>
        <form>
            <span>Select game region: </span>
            <select v-model="region">
                <option disabled value="">Please select one</option>
                <option v-for="r in filterRegions(regions, gameid)" :key="r.regionid" v-bind:value="{ id: r.regionid }">
                    {{ r.regionname }}
                </option>
            </select>
            <br>

            <span>Select game rank: </span>
            <select v-model="rank">
                <option disabled value="">Please select one</option>
                <option v-for="r in filterRanks(ranks, gameid)" :key="r.rankid" v-bind:value="{ id: r.rankid }">
                    {{ r.rankname }}
                </option>
            </select>
            <br>

            <span>Select game role: </span>
            <select v-model="role">
                <option disabled value="">Please select one</option>
                <option v-for="r in filterRoles(roles, gameid)" :key="r.roleid" v-bind:value="{ id: r.roleid }">
                    {{ r.rolename }}
                </option>
            </select>
            <br>
            <v-btn @click="updateProfile()"
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
    name: 'UpdateProfile',
    components: {
    },
    data: () => ({
        token: '',
        profileid: '',
        profile: [],
        profile_expanded: [],
        gameid: '',
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
        fetched: false,
    }),
    mounted() {
        this.retrieveData();
    },
    methods: {
        filterRegions: function(items, gameid) {
            return items.filter(function(r) {
                return r.gameid == gameid;
            })
        },
        filterRanks: function(items, gameid) {
            return items.filter(function(r) {
                return r.gameid == gameid;
            })
        },
        filterRoles: function(items, gameid) {
            return items.filter(function(r) {
                return r.gameid == gameid;
            })
        },
        async retrieveData() {
            this.token = await getJwtToken();
            this.profileid = await localStorage.getItem("profileid");
            this.profile = await Api.getProfile(this.profileid, this.token);
            this.profile_expanded = await Api.getProfileEx(this.profileid, this.token);
            this.gameid = await Api.getGamefromMode(this.profile[0].modeid);
            this.fetched = true;
        },
        async updateProfile() {
            await Api.updateProfile(this.token, this.profileid, this.region.id, this.rank.id, this.role.id);
            localStorage.removeItem("profileid");
            this.$router.push("/gameprofiles");

        }
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
}
</script>
