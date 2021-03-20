<template>
    <div id="profile-list">
        <v-list-item v-for="profile in profiles" :key="profile.profileid">
            <v-card
                class="mx-auto"
                max-width="900"
                outlined
            >
                <v-list-item three-line>
                    <v-list-item-content>
                        <div class="overline mb-4">
                            OVERLINE
                        </div>
                        <v-list-item-title class="headline mb-1">
                            Headline 5
                        </v-list-item-title>
                        <v-list-item-subtitle>Filler Text</v-list-item-subtitle>
                    </v-list-item-content>

                    <v-list-item-avatar
                        tile
                        size="80"
                        color="grey"
                    ></v-list-item-avatar>
                </v-list-item>

                <v-card-actions>
                    <v-btn
                        outlined
                        rounded
                        text
                    >
                        Button
                    </v-btn>
                </v-card-actions>
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
        }
    }
}
</script>
