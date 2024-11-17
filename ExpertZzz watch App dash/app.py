import streamlit as st
import time

# Heart rate data and corresponding co-worker names
heart_rate_data = [108, 105, 110, 112, 109, 115, 111, 117, 108, 112, 105, 120, 
    101, 93, 85, 80, 73, 65, 63, 67, 65, 62, 66, 63]
co_worker_names = "John"

# Use session state to track the current index
if 'current_index' not in st.session_state:
    st.session_state.current_index = 0

# Display the current heart rate and co-worker name
current_heart_rate = heart_rate_data[st.session_state.current_index]
current_name = co_worker_names

st.title("Heart Rate Monitor")
st.write(f"**Name**: {current_name}")
st.write(f"**Heart Rate**: {current_heart_rate} bpm")
st.write("Total hour made: 00:31")
st.write("Total Break take: 00:15")

# Increment the index for the next update
st.session_state.current_index += 1
if st.session_state.current_index >= len(heart_rate_data):
    st.session_state.current_index = 0
