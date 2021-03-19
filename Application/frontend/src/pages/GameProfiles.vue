<template>
    <div id='game-profiles'>
        <profile-list>
            {{ this.token }}
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
        profiles: []
    }),
    mounted() {
        this.loadUserProfiles()
    },
    methods: {
        loadUserProfiles() {
            this.token = getJwtToken();
            console.log(this.token);
            this.profiles = Api.getProfiles(this.token);
            console.log(this.profiles);
        }
    }
}
</script>
