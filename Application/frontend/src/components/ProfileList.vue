<template>
    <div id="profile-list">
        <v-list-item v-for="profile in profiles" :key="profile.profileid">
            <template>
                <v-card
                    class="mx-auto"
                    max-width="900"
                    elevation="5"
                >
                    <v-card-text>
                        <div>{{ profile.gamename }}</div>
                        <p class="display-1 text--primary">
                            {{ profile.modename }}
                        </p>
                    </v-card-text>
                </v-card>
            </template>
        </v-list-item>
        <template>
            <v-card
                class="mx-auto"
                max-width="900"
                elevation="5"
            >
                <v-card-text>
                    <div>Custom Card</div>
                    <p class="display-1 text--primary">
                        Primary Text
                    </p>
                    <p>Secondary Text</p>
                    <div class="text--primary">
                        Bold Text<br>
                        More Text
                    </div>
                </v-card-text>
                <v-card-actions>
                    <v-btn
                        text
                        color="deep-purple accent-4"
                    >
                        Purple Text
                    </v-btn>
                </v-card-actions>
            </v-card>
        </template>
    </div>
</template>

<script>

export default {
    name: "ProfileList",
    props: {
        profiles: {
            type: Array,
            default: () => []
        }
    }
}
</script>
