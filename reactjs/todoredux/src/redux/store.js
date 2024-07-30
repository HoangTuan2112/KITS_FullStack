import { configureStore } from "@reduxjs/toolkit";
import todoReducer from "./todoReducer";
import productReducer from "./productReducer";
import cartReducer from "./cartReducer";

const store = configureStore({
  reducer: {
    todoReducer: todoReducer,
    products:productReducer,
    cart: cartReducer,
  },
});
export default store;
