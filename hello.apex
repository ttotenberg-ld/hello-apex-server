// You will set your LaunchDarkly SDK key during the bridge.

// Set flagKey to the feature flag key you want to evaluate.
String flagKey = 'apex-flag';

LDConfig config = new LDConfig.Builder().build();

LDClient client = new LDClient(config);

// Set up the user properties. This user should appear on your LaunchDarkly users
// dashboard soon after you run the demo.
LDUser dev_user = new LDUser.Builder('5de6fc8b62da8a3d7fc41402624f2319')
    .setFirstName('Ernestina')
    .setLastName('Evans')
    .setEmail('ernestina@example.com')
    .setCustom(new LDValueObject.Builder()
        .set('role', new LDValueArray.Builder()
            .add(LDValue.of('dev'))
            .build()
        )
        .build()
    )
    .build();


LDUser qa_user = new LDUser.Builder('globally-unique-key')
    .setFirstName('Ben')
    .setLastName('Mostes')
    .setEmail('ben@example.com')
    .setCustom(new LDValueObject.Builder()
        .set('role', new LDValueArray.Builder()
            .add(LDValue.of('qa'))
            .build()
        )
        .build()
    )
    .build();

LDUser uat_user = new LDUser.Builder('abcd1234')
    .setFirstName('Tom')
    .setLastName('Totenberg')
    .setEmail('tom@example.com')
    .setCustom(new LDValueObject.Builder()
        .set('role', new LDValueArray.Builder()
            .add(LDValue.of('uat'))
            .build()
        )
        .build()
    )
    .build();

LDUser ga_user = new LDUser.Builder('5678zyxw')
    .setFirstName('Karishma')
    .setEmail('karishma@example.com')
    .setCustom(new LDValueObject.Builder()
        .set('role', new LDValueArray.Builder()
            .add(LDValue.of('ga'))
            .build()
        )
        .build()
    )
    .build();


Boolean dev_value = client.boolVariation(dev_user, flagKey, false);
Boolean qa_value = client.boolVariation(qa_user, flagKey, false);
Boolean uat_value = client.boolVariation(uat_user, flagKey, false);
Boolean ga_value = client.boolVariation(ga_user, flagKey, false);


System.debug('Feature flag is '+dev_value+' for devs.');
System.debug('Feature flag is '+qa_value+' for QA.');
System.debug('Feature flag is '+uat_value+' for UAT.');
System.debug('Feature flag is '+ga_value+' for GA.');