import { createAsyncThunk, createSlice } from "@reduxjs/toolkit";
import axios from "axios";

const url = "https://669f2742b132e2c136fcdd36.mockapi.io/student/student";
const initialState = {
  products: [],
  loading: false,
  error: null,
  flag:"all"
};
// const productReducer = createSlice({
//   name: "product",
//   initialState,
//   reducers: {
//     fetchProductRequest: (state) => {
//       state.loading = true;
//     },
//     fetchProductSuccess: (state, action) => {
//       state.products = action.payload;
//       state.loading = false;
//       state.error = null;
//     },
//     fetchProductFailure: (state, action) => {
//       state.loading = false;
//       state.error = action.payload;
//     },
//   },
// });
export const fetchProductRequest = createAsyncThunk(
  "product/fetchProductRequest",
  async () => {
    const res = await axios.get(url);
    return res.data;
  }
);
export const removeFromProduct = createAsyncThunk("product/removeFromProduct", async (product) => {
  const res = await axios.delete(`${url}/${product.id}`)
  return res.data;
});
export const toggleCheck = createAsyncThunk("product/toggleCheck", async (product) => {
  const res = await axios.put(`${url}/${product.id}`, {
    ...product,
    check: !product.check,
  });
  return res.data;
});
export const updateProduct = createAsyncThunk("product/updateProduct", async (product) => {
  const res = await axios.put(`${url}/${product.id}`, product);
  return res.data;
});
// export const filterProduct = createAsyncThunk("product/filterProduct", async (product) => {
//   const res = await axios.get(`${url}?check=${product.check}`);
//   return res.data;
// });

const productReducer = createSlice({
  name: "products",

  initialState,
  reducers: {
    filterProduct: (state, action) => {
     


    },
  },
  extraReducers: (builder) => {
    builder
    .addCase(fetchProductRequest.pending, (state) => {
      state.status = "loading";
    })
    .addCase(fetchProductRequest.fulfilled, (state, action) => {
      state.status = "success";
      state.products = action.payload;
    })
    .addCase(fetchProductRequest.rejected, (state) => {
      state.status = "failed";
    } )
    .addCase(removeFromProduct.fulfilled, (state, action) => {
      state.products = state.products.filter((product) => product.id !== action.payload.id);
    })
    .addCase(toggleCheck.fulfilled, (state, action) => {
      const index = state.products.findIndex((product) => product.id === action.payload.id);
      state.products[index] = action.payload;
    })
    .addCase(updateProduct.fulfilled, (state, action) => {
      const index = state.products.findIndex((product) => product.id === action.payload.id);
      state.products[index] = action.payload;
    });
  },
});
export const { filterProduct } = productReducer.actions;
export default productReducer.reducer;
