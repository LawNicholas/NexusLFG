<template>
    <div>
        <v-container>
            <v-layout>
                <v-flex xs12 sm6>
                    <v-card hover>
          
                        <v-card-media
                            src="https://raw.githubusercontent.com/ijklim/simon-game/gh-pages/assets/img/bg--game-pad.jpg"
                            height="150px"
                        >
                        </v-card-media>

                        <v-card-title>
                            <h2>v-card-title</h2>
                        </v-card-title>
          
                        <v-card-text>
                            line 1<br>
                            line 2<br>
                            line 3
                        </v-card-text>
          
                        <v-card-actions>
                            <v-btn color=success>Click #1</v-btn>
                            <v-btn flat color=primary>Click #2</v-btn>
                            <v-spacer></v-spacer>
                            <v-btn icon><v-icon>bookmark</v-icon></v-btn>
                        </v-card-actions>
          
                    </v-card>
                </v-flex>
            </v-layout>
        </v-container>
    </div>
</template>

<script>

export default {
  name: "Home2"
};
</script>