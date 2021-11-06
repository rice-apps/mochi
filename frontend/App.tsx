import React from "react";
import {
  StyleSheet,
  Text,
  View,
  Button,
  TouchableOpacity,
  Image,
} from "react-native";

export default function App() {
  return (
    <View style={styles.container}>
      <Image source={require("./assets/logo.png")} />
      <Text style={styles.text}>
        Make <Text style={styles.innerText}>New Friends</Text> on StickyRice
      </Text>
      <Text style={styles.description}>Lorem ipsum</Text>
      <TouchableOpacity style={styles.button}>
        <Text style={styles.buttonText}>Sign In</Text>
      </TouchableOpacity>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: "#F9F4F0",
    alignItems: "center",
    justifyContent: "center",
    position: "relative",
  },
  button: {
    backgroundColor: "#2B292D",
    borderRadius: 8,
    position: "absolute",
    justifyContent: "center",
    bottom: 60,
  },
  text: {
    fontSize: 28,
    width: 288,
    height: 88,
    lineHeight: 40,
    top: 25,
    display: "flex",
    alignItems: "center",
    color: "#000000",
  },
  description: {
    fontSize: 20,
    width: 288,
    height: 88,
    lineHeight: 40,
    top: 20,
    display: "flex",
    alignItems: "center",
    color: "#000000",
  },
  innerText: {
    fontWeight: "600",
  },
  buttonText: {
    fontWeight: "600",
    color: "#fff",
    paddingHorizontal: 130,
    paddingVertical: 20,
    fontSize: 18,
  },
});
