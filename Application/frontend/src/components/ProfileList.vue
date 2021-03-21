<template>
    <div id="profile-list">
        <v-list-item v-for="profile in profiles" :key="profile.profileid">
            <v-card
                class="mx-auto"
                max-width="900"
                min-width="900"
                outlined
            >                
                <v-list-item three-line>
                    <v-list-item-content>
                        <div class="overline mb-4">
                            {{ profile.gamename }}
                        </div>
                        <v-list-item-title class="headline mb-1">
                            {{ profile.modename }}
                        </v-list-item-title>
                        <v-list-item-subtitle>
                            {{ profile.rolename }} &#183; {{ profile.rankname }} &#183; {{profile.regionname }}
                        </v-list-item-subtitle>
                    </v-list-item-content>
                    <v-btn @click="deleteProfile(profile.profileid)">
                        Delete
                    </v-btn>
                </v-list-item>
            </v-card>
        </v-list-item>
    </div>
</template>

<script>

export default {
    name: "ProfileList",
    props: {
        profiles: {
            type: Array,
            default: () => []
        },
        deleteProfile: Function
    },
}
</script>
