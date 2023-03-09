namespace QsharpLogisticRegressions {
    
    // Compute the sigmoid function of a value.
    operation Sigmoid(x : Double) : Double {
        return 1.0 / (1.0 + Exp(-x));
    }

    // Train a logistic regression model using gradient descent.
    operation Train(features : Double[], labels : Double[], alpha : Double, iterations : Int) : Double[] {
        mutable weights = ConstantArray(0.0, Length(features[0]));
        for iteration in 1 .. iterations {
            mutable gradient = ConstantArray(0.0, Length(weights));
            for sampleIndex in 0 .. Length(features) - 1 {
                let predicted = Sigmoid(InnerProduct(weights, features[sampleIndex]));
                let error = predicted - labels[sampleIndex];
                for featureIndex in 0 .. Length(features[0]) - 1 {
                    set gradient w/= featureIndex <- gradient[featureIndex] + error * features[sampleIndex][featureIndex];
                    //set gradient[featureIndex] += error * features[sampleIndex][featureIndex];
                }
            }
            for featureIndex in 0 .. Length(features[0]) - 1 {
                set weights w/= featureIndex <- weights[featureIndex] - alpha * gradient[featureIndex];
                //set weights[featureIndex] -= alpha * gradient[featureIndex];
            }
        }
        return weights;
    }

    // Predict the labels for a set of samples using a logistic regression model.
    operation Predict(features : Double[], weights : Double[]) : Double[] {
        mutable predictions = new Double[Length(features)];
        for sampleIndex in 0 .. Length(features) - 1 {
            let prediction = Sigmoid(InnerProduct(weights, features[sampleIndex]));
            let predictionValue = 0.0;
            if prediction >=0.5
            {
            let predictionValue = 1.0;
            }
            set predictions w/= sampleIndex <- predictionValue;                            
            //set predictions[sampleIndex] = predictionValue;
            
        }
        return predictions;
    }
}
