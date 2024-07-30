import { createSlice } from "@reduxjs/toolkit";

const cartReducer = createSlice({
    name: "cart",
    initialState: {
        cart: [],
        status: 'idle',
        error: null,
    },
    reducers: {
        addToCart: (state, action) => {
            state.cart.push(action.payload);
            console.log(state.cart);
        },
        removeFromCart: (state, action) => {
            state.cart = state.cart.filter((item) => item.id !== action.payload.id);
        },
        clearCart: (state) => {
            state.cart = [];
        },
        setLoading: (state) => {
            state.status = 'loading';
        },
        setError: (state, action) => {
            state.status = 'failed';
            state.error = action.payload;
        },
        setSuccess: (state) => {
            state.status = 'success';
        },
    },

});
 const { actions, reducer } = cartReducer;
export const { addToCart, removeFromCart, clearCart, setLoading, setError, setSuccess } = actions;
export default cartReducer.reducer;