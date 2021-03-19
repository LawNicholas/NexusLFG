import axios from "axios";
//import { authHeader, getUserIdFromToken } from "./auth";
import { getUserIdFromToken } from "./auth"
//import { authHeader, getJwtToken, getUserIdFromToken } from "./auth";

const API_URL = "http://192.168.50.61:443";

class Api {
  getGames() {
    return axios.get(API_URL + "/game", {});
  }

  getProfiles(token) {
    let userid = getUserIdFromToken(token)
    /*
    return fetch(API_URL + `/game_profile_full?userid=eq.` + userid,
    {
      method: `GET`,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': `Bearer ${token}`
      }
    }).then(response => {
      if (response.ok) {
        return response.json()
      }
    })
    */

    return axios.get(API_URL + `/game_profile_full?userid=eq.` + userid,
    {
      headers: {
        'Content-Type':'application/json',
        'Authorization':`Bearer ${token}`
      }
    })
  }

  login(email, password) {
    return axios.post(API_URL + "/rpc/login", { email, password });
  }

  signup(email, password, name) {
    return axios.post(API_URL + "/rpc/signup", { email, password, name });
  }
}

export default new Api();
