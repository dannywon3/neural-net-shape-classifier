let circles = [];
let squares = [];
let triangles = [];

function preload() {
    for (let i = 0; i < 1000; i++) {
        let index = nf(i + 1, 4, 0);
        circles[i] = loadImage(`shapesP3v2/data/circle${index}.png`);
        squares[i] = loadImage(`shapesP3v2/data/square${index}.png`);
        triangles[i] = loadImage(`shapesP3v2/data/triangle${index}.png`);
    }
    
}

let shapeClassifier;

function setup() {
    createCanvas(400, 400);
    // background(0);
    // image(squares[0], 0, 0, width, height);

    // training the network with the data
    let options = {
        inputs: [64, 64, 4],
        task: "imageClassification",
        debug: true,
    }
    shapeClassifier = ml5.neuralNetwork(options);

    for (let i = 0; i < circles.length; i++) {
        // let input = { image: circles[i] };
        // let target = { label: "circle" };
        // shapeClassifier.addData(input, target);
        shapeClassifier.addData({ image: circles[i] }, { label: "circle" });
        shapeClassifier.addData({ image: squares[i] }, { label: "square" });
        shapeClassifier.addData({ image: triangles[i] }, { label: "triangle" });
    }
    shapeClassifier.normalizeData();
    shapeClassifier.train({ epochs: 50 }, finishedTraining);

}

function finishedTraining() {
    console.log("finished training!");
    shapeClassifier.save();
}

