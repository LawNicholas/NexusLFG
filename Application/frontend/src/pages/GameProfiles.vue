<template>
    <div id='game-profiles'>
        <profile-list :profiles="profiles">
        </profile-list>
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
        }
    }
}
</script>
