<template>
    <div id="profile-card">
      <v-card elevation="5">
          <v-card-text>
              <div>
                <p class="display-1 text--primary">
                    {{ game_name }}
                </p>
                <p>
                    {{ mode }}
                </p>
                <p>
                    {{ rank }}
                </p>
                <p>
                    {{ region }}
                </p>
              </div>
          </v-card-text>
      </v-card>
  </div>
</template>

<script>

export default {
    name: "ProfileCard",
    props: {
        game_name: String,
        mode: String,
        rank: String,
        region: String,
        deleteCard: Function
    }
}
</script>
