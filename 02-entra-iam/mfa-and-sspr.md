# MFA and SSPR Configuration

## What is MFA

Multi-Factor Authentication requires users to verify their identity using 
two or more methods before gaining access. A password alone is not sufficient, 
the second factor is typically a phone app notification or a one-time code.

## What is SSPR

Self-Service Password Reset allows users to reset their own password without 
contacting the helpdesk. Users verify their identity using a registered 
authentication method and reset their password independently.

## MFA Configuration

Authentication methods enabled for all users:

| Method | Status | Notes |
|---|---|---|
| Microsoft Authenticator | Enabled | Primary recommended method for all users |
| Temporary Access Pass | Enabled | Used by admins to recover locked out accounts |
| Software OATH tokens | Enabled | Supports third party authenticator apps |
| Email OTP | Enabled | One-time code sent to registered email address |

Authentication methods disabled:

| Method | Status | Reason |
|---|---|---|
| SMS | Disabled | Less secure, subject to SIM swap attacks |
| Voice call | Disabled | Not available in this tenant configuration |
| FIDO2 Passkey | Disabled | Requires hardware security key |
| Certificate-based | Disabled | Requires certificate authority infrastructure |

## SSPR Configuration

| Setting | Value | Reason |
|---|---|---|
| SSPR enabled for | IT Support Staff group | Controlled rollout to a defined group before expanding |
| Methods required to reset | 1 | Standard for most organisations |
| Require registration on sign-in | Yes | Ensures users are always ready to use SSPR |
| Re-confirmation interval | 180 days | Users verify their methods remain current twice yearly |
| Notify users on password reset | Yes | Security alert if password is reset without user knowledge |
| Notify admins on admin reset | Yes | Alerts all admins when any admin password is reset |

## Admin Observation Points

- Authentication methods are managed centrally in Entra, not per user
- SSPR registration status is visible under Password reset, Usage and insights
- Failed SSPR attempts appear in Entra audit logs under Password reset activity
- Temporary Access Pass is the correct resolution for a user locked out of MFA

## Screenshots

- mfa-authentication-methods.png
- sspr-properties.png

<img width="1308" height="873" alt="mfa-authentication-methods" src="https://github.com/user-attachments/assets/72414189-8dad-4b62-881b-2bc4962c4b1f" />


<img width="1338" height="764" alt="sspr-properties" src="https://github.com/user-attachments/assets/37973d1f-ea9f-4ff0-b21f-e3752f3ce0d0" />
