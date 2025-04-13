import { all } from 'redux-saga/effects';
// Import sagas once you create them
// import { authSagas } from '../auth/authSagas';

export default function* rootSaga() {
  yield all([
    // ...authSagas,
    // Add more sagas here
  ]);
}