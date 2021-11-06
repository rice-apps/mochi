import React, { useState } from "react";
import {
  StyleSheet,
  Text,
  View,
  TouchableOpacity,
  TextInput,
} from "react-native";

export default function App() {
  const [count, setCount] = useState(0);
  const [name, setName] = useState("");
  return (
    <View style={styles.container}>
      
      <View style={styles.countContainer}>
      <TouchableOpacity
        style={styles.button}
        onPress={() => setCount(count + 1)}
      >
        <Text style = {styles.buttonText}>Click me</Text>
      </TouchableOpacity>
      <Text style={styles.heading}>You clicked {count} times.</Text>
      </View>

      <View style={styles.nameContainer}>
      <TextInput
        style={styles.input}
        onChangeText={setName}
        value={name}
        placeholder="Your Name"
      />
      <Text style={styles.redMessage}>{name ? "Hello " + name + "!" : ""}</Text>
      </View>

    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: "yellow",
    alignItems: "center", 
    justifyContent: "center"
  },

  countContainer: {
    marginBottom: 50, 
    alignItems: "center"
  },

  nameContainer: {
    alignItems: "center"
  },

  heading: {
    fontSize: 20,
    fontWeight: "bold",
  },

  redMessage: {
    fontSize: 20,
    fontWeight: "bold",
    color: "red",
  },

  button: {
    alignItems: "center",
    backgroundColor: "black",
    padding: 10,
    marginBottom: 10,
    width: 100
  },

  buttonText: {
    fontSize: 10,
    fontWeight: "bold",
    color: "white",
  },

  input: {
    height: 40,
    width: 300,
    margin: 12,
    borderWidth: 1,
    padding: 10,
  },
});
