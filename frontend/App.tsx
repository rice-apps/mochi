import React from 'react'

import { NavigationContainer } from '@react-navigation/native'
import { createNativeStackNavigator } from '@react-navigation/native-stack'

import { Loading, Welcome } from './components'

const Stack = createNativeStackNavigator()

export default function App (): JSX.Element {
  return (
    <NavigationContainer>
      <Stack.Navigator>
        <Stack.Screen name='Welcome' component={Welcome} />
        <Stack.Screen name='Loading' component={Loading} />
      </Stack.Navigator>
    </NavigationContainer>
  )
}
