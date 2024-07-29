import { configureStore } from "@reduxjs/toolkit";
import todoReducer from "./todoReducer";

const store = configureStore({
  reducer: {
    todoReducer: todoReducer,
  },
});
export default store;
