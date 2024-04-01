<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Futuristic City Background</title>
    <style>
        body {
            margin: 0;
            overflow: hidden;
            background-color: #000;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        canvas {
            display: block;
        }
    </style>
</head>
<body>
    <canvas id="background" width="800" height="600"></canvas>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/three.js/r128/three.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.9.1/gsap.min.js"></script>
    <script>
        // Three.js setup
        const scene = new THREE.Scene();
        const camera = new THREE.PerspectiveCamera(75, window.innerWidth / window.innerHeight, 0.1, 1000);
        const renderer = new THREE.WebGLRenderer({ antialias: true });
        resizeRendererToDisplaySize(renderer);
        document.body.appendChild(renderer.domElement);

        // City lights setup
        const lightGeometry = new THREE.BoxGeometry(0.5, 0.5, 10);
        const lightMaterial = new THREE.MeshBasicMaterial({ color: 0x01ff01 });
        const lights = [];

        for (let i = 0; i < 100; i++) {
            const light = new THREE.Mesh(lightGeometry, lightMaterial);
            light.position.x = (Math.random() - 0.5) * 200;
            light.position.y = (Math.random() - 0.5) * 50 + 25;
            light.position.z = (Math.random() - 0.5) * 200;
            scene.add(light);
            lights.push(light);
        }

        // City buildings setup
        const buildingGeometry = new THREE.BoxGeometry(5, Math.random() * 20 + 10, 5);
        const buildingMaterial = new THREE.MeshStandardMaterial({ color: 0xaaaaaa, roughness: 0.8, metalness: 0.2 });

        for (let i = 0; i < 50; i++) {
            const building = new THREE.Mesh(buildingGeometry, buildingMaterial);
            building.position.x = (Math.random() - 0.5) * 200;
            building.position.y = (Math.random() - 0.5) * 50 + 25;
            building.position.z = (Math.random() - 0.5) * 200;
            scene.add(building);
        }

        // Set camera position
        camera.position.set(0, 50, 150);

        // Set up animation
        function animate() {
            requestAnimationFrame(animate);
            lights.forEach(light => {
                light.position.z -= Math.random() * 0.5;
                if (light.position.z < -100) {
                    light.position.z = 100;
                }
            });
            renderer.render(scene, camera);
        }
        animate();

        // GSAP animation
        gsap.to(scene.rotation, { duration: 60, y: Math.PI * 2, repeat: -1, ease: "none" });

        // Resize renderer to display size when window is resized
        function resizeRendererToDisplaySize(renderer) {
            const canvas = renderer.domElement;
            const width = window.innerWidth;
            const height = window.innerHeight;
            const needResize = canvas.width !== width || canvas.height !== height;
            if (needResize) {
                renderer.setSize(width, height);
                camera.aspect = width / height;
                camera.updateProjectionMatrix();
            }
        }

        window.addEventListener('resize', () => {
            resizeRendererToDisplaySize(renderer);
        });
    </script>
</body>
</html>
