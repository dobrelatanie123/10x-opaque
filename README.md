# Regulation Analyzer

## Project Description
Regulation Analyzer is a web application designed to help users analyze legal terms and conditions by simply providing a URL. Using a large language model (LLM), the application identifies potential risks such as personal data disclosure, hidden costs, legal risks, and details concerning data sharing as well as account deletion policies. The platform also assesses and rates the clarity and precision of the terms on a scale of 0–10, while storing detailed analysis reports along with relevant dates for future reference.

## Tech Stack
- **Frontend**: Astro 5, React 19, TypeScript 5, Tailwind CSS 4, Shadcn/ui
- **Backend**: Supabase (PostgreSQL, built-in authentication) for a scalable and open-source backend solution.
- **AI Integration**: Openrouter.ai for interfacing with multiple models (e.g., OpenAI, Anthropic, Google) to ensure high efficiency and cost control.
- **CI/CD & Hosting**: GitHub Actions for CI/CD pipelines and DigitalOcean for Dockerized deployment.

## Getting Started Locally
Follow these steps to set up the project locally:
1. **Clone the repository:**
   ```bash
   git clone https://github.com/your-username/10x-opaque.git
   cd 10x-opaque
   ```
2. **Install dependencies:**
   Ensure you are using the Node.js version specified in the `.nvmrc` file.
   ```bash
   bun install
   ```
3. **Run the development server:**
   ```bash
   bun run dev
   ```
4. **Build the project for production:**
   ```bash
   bun run build
   ```

## Available Scripts
- **dev**: Starts the development server.
- **build**: Builds the application for production.
- **preview**: Previews the production build locally.
- **lint**: Runs the linter to check for code style issues (if configured).

## Project Scope
This project is designed as an MVP for analyzing legal terms and conditions. Key features include:
- Accepting a URL input for legal documents.
- Analyzing the document using LLM to detect potential risks and issues.
- Rating the document on a scale of 0–10.
- Storing detailed analysis reports with execution and validity dates.
- Integration with analytical tools and user authentication for secure access to analysis history.

## Project Status
The project is currently in the MVP stage, under active development. The focus is on core functionality with plans for enhancement based on user feedback and evolving requirements.

## License
This project is licensed under the MIT License.
