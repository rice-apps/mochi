import React, {useState} from 'react';
import { StyleSheet, Text, View } from 'react-native';

export default function App() {
  const [space, setSpace] = useState('        *        ')
  const [word, setWord] = useState('mochi')
  const [count, setCount] = useState(5)

  const goLeft = (a) => {
    let b = ""
    if (a.charAt(0) == '*') {
      return a
    }
    for (let i = 1; i < a.length; i++) {
      b = b + a.charAt(i)
    }
    b = b + ' '
    return b
  }

  const goRight = (a) => {
    let b = ""
    if (a.charAt(a.length-1) == '*') {
      return a
    }
    b = b + ' '
    for (let i = 0; i < a.length - 1; i++) {
      b = b + a.charAt(i)
    }
    return b
  }

  const reset = (e) => {
    setWord(e.taget.value)
    setCount(5)
  }

  const guess = (e) => {
    let a = ""
    for (let i = 0; i < word.length; i++) {
      console.log(word.charAt(i))
      if (e.target.value == word.charAt(i)) {
        continue
      }
      a = a + word.charAt(i)
    }
    if (a == word) {
      setCount(count-1)
    }
    else {
      setWord(a)
    }
  }

  return (
    <View style={styles.container}>
      <Text>Open up App.tsx to start working on your app!</Text>
      <Text>{space}</Text>
      <button onClick={() => setSpace(goLeft(space))}>left</button> <button onClick={() => setSpace(goRight(space))}>right</button>
      <Text></Text>
      <Text></Text>
      <form>
        <label onSubmit={(e) => reset(e)}>Input a word <input type="text"/></label>
      </form>
      <Text></Text>
      <Text>{count}</Text>
      <form>
        <label onSubmit={(e) => guess(e)}>Guess a letter<input type="text"/></label>
      </form>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
  },
  button: {
    alignItems: 'center',
    backgroundColor: '#DDDDDD',
    padding: 10,
    marginBottom: 10
  }
});
