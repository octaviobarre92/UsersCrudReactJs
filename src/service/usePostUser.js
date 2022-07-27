import axios from 'axios'
export default class usePostUsers {
  /** SAVE USERS */
  async saveUsers(jsonUser) {
    try {
      const response = await axios.post(process.env.REACT_APP_USERS_URL, jsonUser)
      return true;
    } catch (err) {
      console.log('KO::USERS', err)
      return false;
    }
  }
  /** UPDATE USERS FOR DATA BY ID */
  async updateUsers(jsonUser) {
    try {
      const response = await axios.patch(`${process.env.REACT_APP_USERS_URL}/${jsonUser._id}`, jsonUser)
      return true;
    } catch (err) {
      console.log('KO::updateUsers', err)
      return false;
    }
  }
  /** DELETE USERS BY ID */
  async deleteUsers(idUser) {
    try {
      const response = await axios.delete(`${process.env.REACT_APP_USERS_URL}/${idUser}`)
      return true;
    } catch (err) {
      console.log('KO::deleteUsers', err)
      return false;
    }
  }
  async getUsersPagination(skip, limit) {
    try {
      const response = await axios.get(`${process.env.REACT_APP_USERS_URL}/?skip=${skip}&limit=${limit}`)
      return response.data;
    } catch (err) {
      console.log('KO::getUsersPagination', err)
      return undefined;
    }
  }

}
