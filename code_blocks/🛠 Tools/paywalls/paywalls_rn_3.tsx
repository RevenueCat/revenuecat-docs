import React from 'react';
import { Text } from 'react-native';

import RevenueCatUI from 'react-native-purchases-ui';

return (
    <RevenueCatUI.PaywallFooterContainerView style={{ backgroundColor: '#f8f8f8' }}>
        <Text>
            Your Custom Paywall Design
        </Text>
    </RevenueCatUI.PaywallFooterContainerView>
);