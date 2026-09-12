import streamlit as st
from auth import register_user, login_user

st.title("Social Media DB — Demo")

if "logged_in" not in st.session_state:
    st.session_state.logged_in = False

if not st.session_state.logged_in:
    tab1, tab2 = st.tabs(["Zaloguj się", "Zarejestruj się"])

    with tab1:
        username = st.text_input("Nazwa użytkownika", key="login_user")
        password = st.text_input("Hasło", type="password", key="login_pass")
        if st.button("Zaloguj"):
            if login_user(username, password):
                st.session_state.logged_in = True
                st.session_state.username = username
                st.rerun()
            else:
                st.error("Błędna nazwa użytkownika lub hasło")

    with tab2:
        new_username = st.text_input("Nazwa użytkownika", key="reg_user")
        new_email = st.text_input("Email", key="reg_email")
        new_password = st.text_input("Hasło", type="password", key="reg_pass")
        if st.button("Zarejestruj"):
            register_user(new_username, new_email, new_password)
            st.success("Zarejestrowano! Możesz się teraz zalogować.")
else:
    st.write(f"Zalogowano jako: **{st.session_state.username}**")
    if st.button("Wyloguj"):
        st.session_state.logged_in = False
        st.rerun()
