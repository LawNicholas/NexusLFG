<template>
    <div id='teams' v-if="fetched">
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
        <teams-list :profileid="profileid" :teams="teams" :leaveTeam="leaveTeam"></teams-list>
    </div>
</template>

<script>
import Api from "../api";
import TeamsList from '@/components/TeamsList.vue'
import { getJwtToken } from '../auth';
export default {
    name: 'Teams',
    components: {
        TeamsList
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
            this.token = getJwtToken();

            var profileids = [];
            profileids = await Api.getProfilesIds(this.token);

            var teamids = [];

            console.log(profileids[0] + " " + profileids.length);
            
            var i;
            for(i = 0; i < profileids.length; i++) {
                var teamids_sub = await Api.getUserTeamIds(profileids[i].profileid);
                var j;
                for(j = 0; j < teamids_sub.length; j++) {
                    teamids.push(teamids_sub[j]);
                }
            }

            this.teams = [];
            
            var i;
            for(i = 0; i < teamids.length; i++) {
                var teamdata = await Api.getTeamfromId(teamids[i]);
                this.teams.push(teamdata);
            }

            this.fetched = true;
        },
        async leaveTeam(teamid) {
            await Api.leaveTeam(this.token, this.profileid, teamid);
            this.loadTeams();
        }
    }
}
</script>
