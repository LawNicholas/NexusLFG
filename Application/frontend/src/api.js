import axios from "axios";
import { BIconPatchCheck } from "bootstrap-vue";
//import { authHeader, getUserIdFromToken } from "./auth";
import { getUserIdFromToken } from "./auth"
//import { authHeader, getJwtToken, getUserIdFromToken } from "./auth";

const API_URL = "http://192.168.50.61:443";

class Api {
  getGames() {
    return axios.get(API_URL + "/game", {});
  }

  getModes() {
    return axios.get(API_URL + "/mode", {});
  }

  getRegions() {
    return axios.get(API_URL + "/region", {});
  }

  getRanks() {
    return axios.get(API_URL + "/rank", {});
  }

  getRoles() {
    return axios.get(API_URL + "/role", {});
  }

  async getGamefromMode(modeid) {

    let mode = []
    const response = await fetch(API_URL + "/mode?modeid=eq." + modeid, {
      method: `GET`
    });
    mode = await response.json();
    return await mode[0].gameid;
  }

  async getProfile(profileid, token) {
    var profile = [];
    const response = await fetch(API_URL + `/game_profile?profileid=eq.` + profileid,
    {
      method: `GET`,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': `Bearer ${token}`
      }
    })

    profile = await response.json();
    return await profile;
  }

  async getProfileEx(profileid, token) {
    var profile = [];
    const response = await fetch(API_URL + `/game_profile_full?profileid=eq.` + profileid,
    {
      method: `GET`,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': `Bearer ${token}`
      }
    })

    profile = await response.json();
    return await profile;
  }

  async getProfiles(token) {
    let userid = getUserIdFromToken(token);

    var profiles = [];
    const response = await fetch(API_URL + `/game_profile_full?userid=eq.` + userid,
    {
      method: `GET`,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': `Bearer ${token}`
      }
    })

    profiles = await response.json();

    return await profiles;
  }

  async createProfile(token, roleid, regionid, rankid, modeid) {
    let userid = getUserIdFromToken(token);

    var body = {
      'userid':`${userid}`,
      'roleid':`${roleid}`,
      'regionid':`${regionid}`,
      'rankid':`${rankid}`,
      'modeid':`${modeid}`
    }
    return axios.post(API_URL + "/game_profile", body,
    {
      headers: {
        'Content-Type': 'application/json',
        'Authorization': `Bearer ${token}`
      }
    });
  }

  async updateProfile(token, profileid, regionid, rankid, roleid) {
    var body = {
      'regionid': regionid,
      'rankid': rankid,
      'roleid': roleid
    }

    return axios.patch(API_URL + "/game_profile?profileid=eq." + profileid, body,
    {
      headers: {
        'Content-Type': 'application/json',
        'Authorization': `Bearer ${token}`
      }
    });
  }

  deleteProfile(profileid, token) {
    return axios.delete(API_URL + "/game_profile?profileid=eq." + profileid,
    {
      headers: {
        "Content-Type": "application/json",
        "Authorization": `Bearer ${token}`
      }
    });
  }

  login(email, password) {
    return axios.post(API_URL + "/rpc/login", { email, password });
  }

  signup(email, password, name) {
    return axios.post(API_URL + "/rpc/signup", { email, password, name });
  }
}

export default new Api();
