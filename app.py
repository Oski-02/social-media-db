import streamlit as st
from auth import register_user, login_user
from posts import get_feed, get_comments
from users import search_users, is_following, follow_user

st.title("Social Media DB — Demo")

if "logged_in" not in st.session_state:
    st.session_state.logged_in = False

if not st.session_state.logged_in:
    tab1, tab2 = st.tabs(["Zaloguj się", "Zarejestruj się"])

    with tab1:
        username = st.text_input("Nazwa użytkownika", key="login_user")
        password = st.text_input("Hasło", type="password", key="login_pass")
        if st.button("Zaloguj"):
            user_id = login_user(username, password)
            if user_id:
                st.session_state.logged_in = True
                st.session_state.username = username
                st.session_state.user_id = user_id
                st.rerun()
            else:
                st.error("Błędna nazwa użytkownika lub hasło")

    with tab2:
        new_username = st.text_input("Nazwa użytkownika", key="reg_user")
        new_email = st.text_input("Email", key="reg_email")
        new_password = st.text_input("Hasło", type="password", key="reg_pass")
        if st.button("Zarejestruj"):
            if register_user(new_username, new_email, new_password):
                st.success("Zarejestrowano! Możesz się teraz zalogować.")
            else:
                st.error("Taki użytkownik już istnieje")
else:
    st.write(f"Zalogowano jako: **{st.session_state.username}**")

    st.subheader("Znajdź użytkowników")
    search_query = st.text_input("Szukaj po nazwie użytkownika", key="user_search")
    if search_query:
        results = search_users(search_query, st.session_state.user_id)
        if results:
            for found_id, found_username in results:
                col1, col2 = st.columns([3, 1])
                col1.write(found_username)
                if is_following(st.session_state.user_id, found_id):
                    col2.write("Obserwujesz")
                else:
                    if col2.button("Obserwuj", key=f"follow_{found_id}"):
                        follow_user(st.session_state.user_id, found_id)
                        st.rerun()
        else:
            st.write("Brak wyników")

    st.divider()
    st.subheader("Feed")
    for post in get_feed(st.session_state.user_id):
        post_id, content, image_url, username, like_count, comment_count = post
        st.write(f"**{username}**")
        st.write(content)
        st.write(f"👍 {like_count} polubień | 💬 {comment_count} komentarzy")

        with st.expander(f"Zobacz komentarze ({comment_count})"):
            comments = get_comments(post_id)
            if comments:
                for comment_username, comment_content in comments:
                    st.write(f"**{comment_username}:** {comment_content}")
            else:
                st.write("Brak komentarzy")

        st.divider()

    if st.button("Wyloguj"):
        st.session_state.logged_in = False
        st.rerun()
