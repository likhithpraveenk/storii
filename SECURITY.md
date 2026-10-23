# Security

## Data & Privacy

Storii does not collect any data. There are no analytics, no telemetry, and no external servers involved.

Everything stays between your device and your Audiobookshelf server:

- Server URL and authentication tokens are stored locally on your device
- Downloads and cached content are stored locally on your device
- No data is ever sent to me or any third party

## Security-Relevant Settings

- **Trust all certificates** (Settings > Advanced) disables TLS certificate validation for self-signed servers. When enabled, the connection is no longer protected against man-in-the-middle attacks; only enable it for a server you control.
- Two-factor/SSO credentials are not stored by Storii; only the server-issued access/refresh tokens are persisted.

## Reporting a Vulnerability

If you find a security issue, open a regular [GitHub issue](https://github.com/likhithpraveenk/storii/issues/new) with redacted logs before sharing.
