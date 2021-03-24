<template>
    <div id='find-team' v-if="fetched">
        <div
            :style="{left: '50%', transform:'translateX(0%)', margin:'20px'}"
        >
            <b-button variant="primary" href="#/mainmenu">Main Menu</b-button>
        </div>
        <div
            :style="{left: '50%', transform:'translateX(0%)', margin:'20px'}"
        >
            <b-button variant="primary" href="#/logout">Logout</b-button>
        </div>
        <find-team-list :profileid="profileid" :teams="teams" :joinTeam="joinTeam"></find-team-list>
    </div>
</template>

<script>
import Api from "../api";
import FindTeamList from '@/components/FindTeamList.vue'
import { getJwtToken } from '../auth';
export default {
    name: 'FindTeam',
    components: {
        FindTeamList
    },
    data: () => ({
        token: "",
        teams: [],
        gameid: "",
        profileid: "",
        fetched: false
    }),
    mounted() {
        this.loadTeams();
    },
    methods: {
        async loadTeams() {
            this.gameid = localStorage.getItem("gameid");
            this.profileid = localStorage.getItem("profileid");

            this.token = getJwtToken();
            this.teams = await Api.getTeams(this.token, this.gameid);
            this.fetched = true;
        },
        async joinTeam(teamid) {
            await Api.joinTeam(this.token, this.profileid, teamid);
            localStorage.removeItem("gameid");
            localStorage.removeItem("profileId");
            this.$router.push("/gameprofiles");
        }
    }
}
</script>
