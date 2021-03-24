<template>
    <div id='game-profiles' v-if="fetched">
        <div
            :style="{left: '50%', transform:'translateX(92%)', margin:'20px'}"
        >
            <b-button variant="primary" href="#/logout">Logout</b-button>
        </div>
        <profile-list :profiles="profiles" :updateProfile="updateProfile" :deleteProfile="deleteProfile"></profile-list>
        <v-btn href="#/CreateGameProfile"
            :style="{left: '50%', transform:'translateX(-50%)', margin:'20px'}"
        >
            Create Profile
        </v-btn>
    </div>
</template>

<script>
import Api from "../api";
import ProfileList from '@/components/ProfileList.vue'
import { getJwtToken } from '../auth';
export default {
    name: 'GameProfiles',
    components: {
        ProfileList
    },
    data: () => ({
        token: "",
        profiles: [],
        fetched: false
    }),
    mounted() {
        this.loadUserProfiles();
    },
    methods: {
        async loadUserProfiles() {
            this.token = getJwtToken();
            this.profiles = await Api.getProfiles(this.token);
            this.fetched = true;
        },
        async deleteProfile(profileid) {
            this.fetched = false;
            await Api.deleteProfile(profileid, this.token);
            this.loadUserProfiles();
        },
        async updateProfile(profileid) {
            localStorage.setItem("profileid", profileid);
            this.$router.push("/updateprofile");
        },
    }
}
</script>
