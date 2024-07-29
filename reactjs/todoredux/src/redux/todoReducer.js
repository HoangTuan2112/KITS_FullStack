import { createSlice } from "@reduxjs/toolkit";

const initialState = {
  students: [
    {
      id: 1,
      job: "Learn React",
      check: false,
    },
    {
      id: 2,
      job: "Learn Redux",
      check: false,
    },
    {
      id: 3,
      job: "Learn Redux Toolkit",
      check: false,
    },
  ],
};
const todoReducer = createSlice({
  name: "list",
  initialState,
  reducers: {
    addToDo: (state, action) => {
      state.students = [
        ...state.students,
        {
          id: (state.students.length > 0
            ?state.students.reduce((a, b) => (a.id > b.id ? a : b)).id + 1:1),
          job: action.payload,
          check: false,
        },
      ];
      console.log(state.students);
    },
    checkToDo: (state, action) => {
      state.students.map((todo) => {
        if (todo.id === action.payload) {
          todo.check = !todo.check;
        }
        return todo;
      });
    },
    deleteToDo: (state, action) => {
      state.students = state.students.filter(
        (todo) => todo.id !== action.payload
      );
    },
    updateToDo: (state, action) => {
      state.students.map((todo) => {
        if (todo.id === action.payload.id) {
          todo.job = action.payload.job;
        }
        return todo;
      });
    },
  },
});

export const { addToDo, checkToDo, deleteToDo, updateToDo } =
  todoReducer.actions;
export default todoReducer.reducer;
