import React from 'react'
import { View, Text, StyleSheet } from 'react-native'

export const LoadingPage = (): JSX.Element => {
  return (
    <View style={styles.container}>
      <Text style={styles.mainText}>Welcome back!</Text>
    </View>
  )
}

export default React.memo(LoadingPage)

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
    alignItems: 'center',
    justifyContent: 'center'
  },
  mainText: {
    fontSize: 36
  }
})
