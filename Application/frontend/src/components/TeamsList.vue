<template>
    <div id="teams-list">
        <v-list-item v-for="team in teams" :key="team.teamid">
            <v-card
                class="mx-auto"
                max-width="900"
                min-width="900"
                outlined
            >                
                <v-list-item three-line>
                    <v-list-item-content>
                        <div class="headline mb-1">
                            {{ team.teamname }}
                        </div>
                        <v-list-item-subtitle>
                            {{ team.description }}
                        </v-list-item-subtitle>
                    </v-list-item-content>
                    <v-btn @click="leaveTeam(team.teamid)">
                        Leave
                    </v-btn>
                </v-list-item>
            </v-card>
        </v-list-item>
    </div>
</template>

<script>
export default {
    name: "TeamsList",
    props: {
        profileid: String,
        teams: {
            type: Array,
            default: () => []
        },
        leaveTeam: Function
    },
}
</script>
